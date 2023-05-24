(deftemplate set (multislot name) (multislot members))
(deffacts initial (phase input))

(defrule input-number
    (phase input)
    =>
    (printout t "Please input a set s1: ")
    (assert (set (name s1) (members (explode$ (readline)))))
    (printout t "Please input a set s2: ")
    (assert (set (name s2) (members (explode$ (readline))))))

(defrule check-input-error-1
    ?f1 <- (phase input)
    ?f2 <- (set (name ?t1) (members $? ?a $? ?a $?))
    ?f3 <- (set (name ?t2&~?t1) (members $?))
    =>
    (retract ?f1 ?f2 ?f3)
    (printout t "Input error!! Duplicate element are not allowed in sets!!" crlf)
    (assert (phase input)))

(defrule check-input-error-2
    ?f1 <- (phase input)
    ?f2 <- (set (name ?t1) (members $? ?a $?))
    ?f3 <- (set (name ?t2&~?t1) (members $?))
    (test (not (integerp ?a)))
    =>
    (retract ?f1 ?f2 ?f3)
    (printout t "Input error!! Some element are not integers!!" crlf)
    (assert (phase input)))


(defrule check-no-error
(declare(salience -10))
?f<-(phase input)
=>
(retract ?f)
(assert (phase intersect))
(assert (set(name s1 intersect s2)(members )))
)


(defrule intersect1
(phase intersect)
?f<-(set(name s1)(members $?a ?b $?c))
?f1<-(set(name s2)(members $?d ?b $?e))
?f2<-(set(name s1 intersect s2)(members $?g))
=>
(retract ?f ?f1 ?f2)
(assert (set(name s1)(members  $?a $?c)))
(assert (set(name s2)(members  $?d $?e)))
(assert (set(name s1 intersect s2)(members $?g ?b)))
)


(defrule intersect1-union
(declare(salience -10))
?f<-(phase intersect)
=>
(retract ?f)
(assert (phase union))
(assert (set(name s1 union s2)(members )))
)

(defrule intersect1-2
?f1<-(phase union)
(set(name s1)(members $?a))
(set(name s2)(members $?d))
?f2<-(set(name s1 union s2)(members $?g))
=>
(retract ?f1 ?f2)
(assert (set(name s1 union s2)(members $?a $?d)))
(assert (phase final))
)

(defrule union-1
?k<-(phase final)
?f<-(set(name s1)(members $?a))
?f1<-(set(name s2)(members $?d))
(set(name s1 intersect s2)(members $?g))
?f3<-(set(name s1 union s2)(members $?q))
=>
(retract ?f ?f1 ?k ?f3)
(assert (set(name s1)(members $?a $?g)))
(assert (set(name s2)(members $?d $?g)))
(assert (set(name s1 union s2)(members $?q $?g)))
(assert (phase big))
)

(defrule big-small
(phase big)
?f<-(set(name s1)(members $?a ?b $?c ?d $?e))
(test (> ?b ?d))
=>
(retract ?f)
(assert (set(name s1)(members $?a ?d $?c ?b $?e)))
)

(defrule big-small-1
(phase big)
?f<-(set(name s2)(members $?a ?b $?c ?d $?e))
(test (> ?b ?d))
=>
(retract ?f)
(assert (set(name s2)(members $?a ?d $?c ?b $?e)))
)

(defrule big-small-2
(phase big)
?f<-(set(name s1 intersect s2)(members $?a ?b $?c ?d $?e))
(test (> ?b ?d))
=>
(retract ?f)
(assert (set(name s1 intersect s2)(members $?a ?d $?c ?b $?e)))
)

(defrule big-small-3
(phase big)
?f<-(set(name s1 union s2)(members $?a ?b $?c ?d $?e))
(test (> ?b ?d))
=>
(retract ?f)
(assert (set(name s1 union s2)(members $?a ?d $?c ?b $?e)))
)



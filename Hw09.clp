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

(defrule input-no-error
    (declare (salience -10))
    ?f <- (phase input)
    =>
    (retract ?f)
    (assert (phase compute)))

(defrule compute-1-1
    (declare (salience 5))
    (phase compute)
    (not (set (name s3) (members $?)))
    (set (name s4) (members $?member))
    =>
    (assert (set (name s3) (members  $?member))))

(defrule compute-1-2
    (declare (salience 10))
    (phase compute)
    ?f <- (set (name s3) (members $?member))
    (set (name ?t1) (members $? ?a $?))
    (set (name ?t2&~?t1) (members $?base))
    (test (not (member$ ?a $?base)))
    (test (not (member$ ?a $?member)))
    (and (or (test (eq ?t1 s1)) (test (eq ?t1 s2))) (or (test (eq ?t2 s1)) (test (eq ?t2 s2))))
    =>
    (retract ?f)
    (assert (set (name s3) (members $?member ?a))))

(defrule compute-2-1
    (declare (salience 0))
    (phase compute)
    (not (set (name s4) (members $?)))
    (set (name ?t1) (members $? ?a $?))
    (set (name ?t2&~?t1) (members $? ?a $?))
    (and (or (test (eq ?t1 s1)) (test (eq ?t1 s2))) (or (test (eq ?t2 s1)) (test (eq ?t2 s2))))
    =>
    (assert (set (name s4) (members ?a))))

(defrule compute-2-2
    (declare (salience 10))
    (phase compute)
    ?f <- (set (name s4) (members $?member))
    (set (name ?t1) (members $? ?a $?))
    (set (name ?t2&~?t1) (members $? ?a $?))
    (test (not (member$ ?a $?member)))
    (and (or (test (eq ?t1 s1)) (test (eq ?t1 s2))) (or (test (eq ?t2 s1)) (test (eq ?t2 s2))))
    =>
    (retract ?f)
    (assert (set (name s4) (members $?member ?a))))

(defrule compute-final
    (declare (salience -10))
    (phase compute)
    ?f <- (set (name ?s) (members $?t1 ?a1 $?t2 ?a2 $?t3))
    (test (> ?a1 ?a2))
    =>
    (retract ?f)
    (assert (set (name ?s) (members $?t1 ?a2 $?t2 ?a1 $?t3))))

(defrule change-phase-2
    (declare (salience -20))
    (phase compute)
    =>
    (open "set.txt" out "w")
    (assert (phase output-file)))

(defrule output-file-01
    (declare (salience 10))
    (phase output-file)
    ?f1 <- (set (name s1) (members $?member))
    =>
    (printout out "(set (name s1) (members " (implode$ $?member) "))" crlf)
    (retract ?f1))

(defrule output-file-02
    (declare (salience 9))
    (phase output-file)
    ?f1 <- (set (name s2) (members $?member))
    =>
    (printout out "(set (name s2) (members " (implode$ $?member) "))" crlf)
    (retract ?f1))

(defrule output-file-03
    (declare (salience 8))
    (phase output-file)
    ?f1 <- (set (name s3) (members $?member))
    =>
    (printout out "(set (name s1 union s2) (members " (implode$ $?member) "))" crlf)
    (retract ?f1))

(defrule output-file-04
    (declare (salience 7))
    (phase output-file)
    ?f1 <- (set (name s4) (members $?member))
    =>
    (printout out "(set (name s1 intersect s2) (members " (implode$ $?member) "))" crlf)
    (retract ?f1))

(defrule output-file-end
    (declare (salience 0))
    (phase output-file)
    =>
    (close out))
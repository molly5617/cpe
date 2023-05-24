(deftemplate binary-# (multislot name)(multislot digits))
(deftemplate binary-adder(multislot name-1)(multislot name-2)(slot carry)(multislot #-1)(multislot #-2)(multislot result))

(deffacts initial-fact 
    (phase input-amount)
    (number 0)
)

(defrule input-amount
    (phase input-amount)
    =>
    (printout t "Please input the amount of binary numbers to added:")
    (assert (amount(read)))
)

(defrule input-amount-wrong
    (declare(salience 20))
    ?g<-(phase input-amount)
    ?f<-(amount ?a)
    (test(or (not (integerp ?a))(< ?a 0)))
    =>
    (retract ?f ?g)
    (printout t "Please input a positive integer!! " crlf)
    (assert (phase input-amount))
)

(defrule input-amount-correct
    
    ?g<-(phase input-amount)
    (amount ?a)
    (test (integerp ?a) )
    =>
    (retract ?g)
    (assert (phase input-binary-#))
)

(defrule input-binary-#
    (phase input-binary-#)
    (amount ?a)
    ?f<-(number ?n)
    (test(< ?n ?a))
    =>
    (retract ?f)
    (printout t "Please input binary number # " (+ ?n 1) ":")
    (assert (binary-#(name (+ ?n 1))(digits(explode$ (readline)))))
    (assert(number(+ ?n 1)))
)

(defrule input-binary-error
    (declare (salience 20))
    (phase input-binary-#)
    ?f<-(binary-#(name $?)(digits $? ?a $?))
    (test(not (or (eq 1 ?a)(eq 0 ?a))))
    ?f1<-(number ?n)
    =>
    (printout t "Input error!! Please input binary number " crlf)
    (retract ?f ?f1)
    (assert(number(- ?n 1)))
)

(defrule input-binary-correct
    ?f<-(phase input-binary-#)
    (number ?a)
    (amount ?b)
    (test (eq ?a ?b))
    =>
    (retract ?f)
    (assert (phase add-binary-#))
    
)

(defrule create-adder
    (phase add-binary-#)
    ?f1<-(binary-#(name $?n1)(digits $?d1))
    ?f2<-(binary-#(name $?n2&~$?n1)(digits $?d2))
    =>
    (retract ?f1 ?f2)
    (assert(binary-adder(name-1 ?n1)(name-2 ?n2)(carry 0)(#-1 $?d1)(#-2 $?d2)(result)))
)

(defrule adder-case-1
    (phase add-binary-#)
    ?f<-(binary-adder(carry ?c)(#-1 $?n1 ?d1)(#-2 $?n2 ?d2)(result $?r))
    =>
    (modify ?f (carry (integer (/ (+ ?c ?d1 ?d2) 2))) (result (mod (+ ?c ?d1 ?d2) 2) ?r) (#-1 ?n1) (#-2 ?n2))
)

(defrule adder-case-2
    (declare (salience 10))
    ?f <- (binary-adder (carry ?c) (#-1 ?d1) (#-2 $?n2 ?d2) (result $?r))
    =>
    (modify ?f (carry (integer (/ (+ ?c ?d1 ?d2) 2))) (result (mod (+ ?c ?d1 ?d2) 2) $?r) (#-1 0) (#-2 ?n2)))

(defrule adder-case-3
    (declare (salience 10))
    ?f <- (binary-adder (carry ?c) (#-1 $?n1 ?d1) (#-2 ?d2) (result $?r))
    =>
    (modify ?f (carry (integer (/ (+ ?c ?d1 ?d2) 2))) (result (mod (+ ?c ?d1 ?d2) 2) $?r) (#-1 ?n1) (#-2 0)))

(defrule adder-case-4
    (declare (salience 20))
    ?f <- (binary-adder (carry ?c) (name-1 $?n1) (name-2 $?n2) (#-1 ?d1) (#-2 ?d2) (result $?r))
    =>
    (retract ?f)
    (assert (binary-# (name { $?n1 + $?n2 }) (digits (integer (/ (+ ?c ?d1 ?d2) 2)) (mod (+ ?c ?d1 ?d2) 2) $?r))))



(defrule adder-case-5
    (declare (salience 30))
    ?f <- (binary-adder (carry ?c) (name-1 $?n1) (name-2 $?n2) (#-1 ?d1) (#-2 ?d2) (result $?r))
    (test (eq 0 ?d1))
    (test (eq 0 ?d2))
    (test (eq 0 ?c))
    =>
    (retract ?f)
    (assert (binary-# (name { $?n1 + $?n2 }) (digits $?r))))

(defrule print-case
    (declare (salience -100))
    ?f1 <- (binary-# (name $?n1) (digits $?d1))
    =>
    (retract ?f1)
    (printout t (implode$ $?n1) ":" (implode$ $?d1) crlf))
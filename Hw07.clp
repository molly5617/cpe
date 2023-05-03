(deftemplate binary-# (multislot name) (multislot digits))
(deftemplate binary-adder (multislot name-1) (multislot name-2) (slot carry) (multislot #-1) (multislot #-2) (multislot result))
(deffacts initial-fact (phase input-amount) (number 0))

(defrule input-amount
    (phase input-amount)
    =>
    (printout t "Please input the amount of binary numbers to be added:")
    (assert (amount (read))))

(defrule input-amount-wrong
    ?phase <- (phase input-amount)
    ?amount <- (amount ?num&:(or (not (integerp ?num)) (<= ?num 0)))
    =>
    (retract ?phase ?amount)
    (assert (phase input-amount))
    (printout t "Please input a positive integer!!" crlf))

(defrule input-amount-right
    ?phase <- (phase input-amount)
    (amount ?num)
    (test (integerp ?num))
    (test (> ?num 0))
    =>
    (retract ?phase)
    (assert (phase input-binary-#)))

(defrule input-binary-#
    (phase input-binary-#)
    (amount ?num)
    ?f <- (number ?n)
    (test (< ?n ?num))
    =>
    (retract ?f)
    (assert (number (+ ?n 1)))
    (printout t "Please input binary number #" (+ ?n 1) ": ")
    (assert (binary-# (name (+ ?n 1)) (digits (explode$(readline))))))

(defrule input-binary-#-wrong
    ?binary <- (binary-# (name ?f1) (digits $? ?f2 $?))
    ?number <- (number ?n)
    (test (neq ?f2 0))
    (test (neq ?f2 1))
    =>
    (retract ?binary ?number)
    (assert (number (- ?f1 1)))
    (printout t "Input error!! Please input binary numbers!!" crlf))

(defrule input-binary-#-right
    ?phase <- (phase input-binary-#)
    (number ?n)
    (amount ?num)
    (test (eq ?n ?num))
    =>
    (retract ?phase)
    (assert (phase add-binary-#)))

(defrule create-adder
    (phase add-binary-#)
    ?f1 <- (binary-# (name $?n1) (digits $?d1))
    ?f2 <- (binary-# (name $?n2&~$?n1) (digits $?d2))
    =>
    (retract ?f1 ?f2)
    (assert (binary-adder (name-1 ?n1) (name-2 ?n2) (carry 0) (#-1 ?d1) (#-2 ?d2) (result))))

(defrule adder-case-1
    (declare (salience 5))
    ?f <- (binary-adder (carry ?c) (#-1 $?n1 ?d1) (#-2 $?n2 ?d2) (result $?r))
    =>
    (modify ?f (carry (integer (/ (+ ?c ?d1 ?d2) 2))) (result (mod (+ ?c ?d1 ?d2) 2) $?r) (#-1 ?n1) (#-2 ?n2)))

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


(deftemplate permutation (multislot values) (multislot rest))
(deffacts initial (total 0))

(defrule read-base-fact
    (declare (salience 100))
    =>
    (printout t "Please input a base fact for the permutation...")
    (bind ?input (explode$(readline))) ; 字串轉 value
    (assert (permutation (values) (rest ?input)))
)

(defrule move1
    (declare (salience 100))
    (permutation (values $?p1) (rest $?p2 ?b1 $?p3))
    =>
    (assert (permutation (values $?p1 ?b1) (rest $?p2 $?p3)))
)

(defrule output-permutation
    (declare (salience 100))
    ?old_permutation <- (permutation (values $?b1) (rest))
    ?old_total <- (total ?total)
    =>
    (retract ?old_total ?old_permutation)
    (printout t "Permutation is (" $?b1 ")" crlf)
    (assert (total (+ ?total 1)))
)

(defrule output-total
    (declare (salience 1))
    (not (permutation (values $?b1) (rest)))
    (total ?total)
    =>
    (printout t "The total number is " ?total crlf)
)
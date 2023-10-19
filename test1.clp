(defmodule MAIN (export deftemplate ?ALL))
(deftemplate MAIN::cell (slot row) (slot column) (slot status))
(deftemplate MAIN::dimensions (slot rows) (slot columns))
(defrule MAIN::life-init
(last-generation ?l)
?f <- (current-generation ?c&:(<= ?c ?l))
=>
(retract ?f)
(assert (current-generation (+ ?c 1)))
(focus PRINT COMPUTE-NEIGHBORS NEXT-GENERATION))

(defmodule PRINT (import MAIN deftemplate ?ALL))

(defmodule COMPUTE-NEIGHBORS (import MAIN deftemplate cell) 
                    (export deftemplate neighbor-sum))
(deftemplate COMPUTE-NEIGHBORS::neighbor (slot row) (slot column) (multislot live-cell))
(deftemplate COMPUTE-NEIGHBORS::neighbor-sum (slot row) (slot column) (slot value))

(defmodule NEXT-GENERATION (import MAIN deftemplate cell) 
                (import COMPUTE-NEIGHBORS deftemplate neighbor-sum))

(deffacts MAIN::initial

(cell (row 1) (column 1) (status -))
(cell (row 1) (column 2) (status *))
(cell (row 1) (column 3) (status -))
(cell (row 1) (column 4) (status -))
(cell (row 1) (column 5) (status *))

(cell (row 2) (column 1) (status -))
(cell (row 2) (column 2) (status *))
(cell (row 2) (column 3) (status *))
(cell (row 2) (column 4) (status *))
(cell (row 2) (column 5) (status *))

(cell (row 3) (column 1) (status -))
(cell (row 3) (column 2) (status *))
(cell (row 3) (column 3) (status -))
(cell (row 3) (column 4) (status -))
(cell (row 3) (column 5) (status *))

(cell (row 4) (column 1) (status -))
(cell (row 4) (column 2) (status -))
(cell (row 4) (column 3) (status -))
(cell (row 4) (column 4) (status *))
(cell (row 4) (column 5) (status -))

(cell (row 5) (column 1) (status -))
(cell (row 5) (column 2) (status -))
(cell (row 5) (column 3) (status -))
(cell (row 5) (column 4) (status -))
(cell (row 5) (column 5) (status -))

(dimensions (rows 5) (columns 5))
(current-generation 0)
(last-generation 4)
)





(defrule PRINT::start-print
(current-generation ?g)
=>
(assert (print-row 1))
(assert (print-column 1))
(printout t crlf "Generation " ?g crlf))


(defrule PRINT::cell-print
(declare (salience 10))
(dimensions (rows ?nr) (columns ?nc))
?f <- (print-column ?c&:(<= ?c ?nc))
(print-row ?r&:(<= ?r ?nr))
(cell (row ?r) (column ?c) (status ?s))
=>
(printout t ?s " ")
(retract ?f)
(assert (print-column (+ 1 ?c)))
)

(defrule PRINT::cell-print-blank
(declare (salience 5))
(dimensions (rows ?nr) (columns ?nc))
?f <- (print-row ?c&:(<= ?c ?nr))
?f2 <- (print-column ?d)
=>
(printout t crlf)
(retract ?f ?f2)
(assert (print-row (+ 1 ?c)))
(assert (print-column (+ 1 0)))
)

(defrule COMPUTE-NEIGHBORS::make-neighbors
(cell (row ?x) (column ?y) (status *))
=>
(assert (neighbor (row (- ?x 1)) (column (- ?y 1)) (live-cell ?x ?y)))
(assert (neighbor (row (- ?x 1)) (column ?y) (live-cell ?x ?y)))
(assert (neighbor (row (- ?x 1)) (column (+ ?y 1)) (live-cell ?x ?y)))
(assert (neighbor (row ?x) (column (- ?y 1)) (live-cell ?x ?y)))
(assert (neighbor (row ?x) (column (+ ?y 1)) (live-cell ?x ?y)))
(assert (neighbor (row (+ ?x 1)) (column (- ?y 1)) (live-cell ?x ?y)))
(assert (neighbor (row (+ ?x 1)) (column ?y) (live-cell ?x ?y)))
(assert (neighbor (row (+ ?x 1)) (column (+ ?y 1)) (live-cell ?x ?y))))

(defrule COMPUTE-NEIGHBORS::cleanup-neighbors
?f1 <- (neighbor (row ?x) (column ?y) (live-cell $?))
(not (cell (row ?x) (column ?y) (status ?)))
=>
(retract ?f1))

(defrule COMPUTE-NEIGHBORS::create-neighbor-sum
(cell (row ?x) (column ?y) (status ?))
=>
(assert (neighbor-sum (row ?x) (column ?y) (value 0))))

(defrule COMPUTE-NEIGHBORS::add-neighbor-sum
?f<-(neighbor-sum (row ?x) (column ?y) (value ?a))
?f1<-(neighbor (row ?x) (column ?y) (live-cell $?c))
=>
(retract ?f ?f1)
(assert (neighbor-sum (row ?x) (column ?y) (value (+ 1 ?a))))
)

(defrule NEXT-GENERATION::continue-life
    ?a <- (cell (row ?x) (column ?y) (status *))
    ?b <- (neighbor-sum (row ?x) (column ?y) (value 2|3))
    =>
    (retract ?a ?b)
    (assert (cell (row ?x) (column ?y) (status *))))

(defrule NEXT-GENERATION::dead-life
?a <- (cell (row ?x) (column ?y) (status *))
?b <- (neighbor-sum (row ?x) (column ?y) (value ?c))
(test (neq ?c 2))
(test (neq ?c 3))
=>
(retract ?a ?b)
(assert (cell (row ?x) (column ?y) (status -))))


(defrule NEXT-GENERATION::re-life

?a <- (cell (row ?x) (column ?y) (status -))
?b <- (neighbor-sum (row ?x) (column ?y) (value 3))
=>
(retract ?a ?b)
(assert (cell (row ?x) (column ?y) (status *))))



(defrule NEXT-GENERATION::continue-dead
?a <- (cell (row ?x) (column ?y) (status -))
?b <- (neighbor-sum (row ?x) (column ?y) (value ?c))
(test (neq ?c 3))
=>
(retract ?a ?b)
(assert (cell (row ?x) (column ?y) (status -))))



(defrule NEXT-GENERATION::continue-dead
?a <- (cell (row ?x) (column ?y) (status -))
?b <- (neighbor-sum (row ?x) (column ?y) (value ?c))
(test (neq ?c 3))
=>
(retract ?a ?b)
(assert (cell (row ?x) (column ?y) (status -))))




(defrule NEXT-GENERATION::delete-sum
    (declare (salience -5))
    ?a <- (neighbor-sum (row ?x) (column ?y) (value $?))
    =>
    (retract ?a))








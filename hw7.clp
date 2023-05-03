(deftemplate sales (slot id) (multislot items))
(deftemplate same (multislot pair) (multislot items))
(deftemplate recommend (slot id) (multislot similar) (multislot items))
(deffacts initial (phase load-data))

(defrule assert-data
    (phase load-data)
    =>
    (load-facts "C:\\cpe\\record-02.txt")
    (open "C:\\cpe\\recommend.txt" out "w"))

(defrule generate-recommand
    (phase load-data)
    (sales (id ?id1) (items $?))
    =>
    (assert (recommend (id ?id1) (similar) (items))))

(defrule generate-pair
    (phase load-data)
    (sales (id ?id1) (items $?))
    (sales (id ?id2 & ~?id1) (items $?))
    =>
    (assert (same (pair ?id1 ?id2) (items))))

(defrule generate-same-items
    (phase load-data)
    ?f <- (same (pair ?id1 ?id2) (items $?items))
    (sales (id ?id1) (items $? ?x $?))
    (sales (id ?id2) (items $? ?x $?))
    (test (not (member$ ?x $?items)))
    =>
    (retract ?f)
    (assert (same (pair ?id1 ?id2) (items $?items ?x))))

(defrule change-phase-1
    (declare (salience -10))
    (phase load-data)
    =>
    (assert (phase find-similar)))

(defrule find-similar-one
    (declare (salience 10))
    (phase find-similar)
    ?f1 <- (same (pair ?id1 ?id2) (items $?items_a))
    ?f2 <- (same (pair ?id1 ?id3) (items $?items_b))
    (test (neq ?id2 ?id3))
    (test (< (length$ $?items_a) (length$ $?items_b)))
    =>
    (retract ?f1))

(defrule find-similar-two-1
    (phase find-similar)
    ?f1 <- (same (pair ?id1 ?id2) (items $?target))
    ?f2 <- (recommend (id ?id1) (similar $?member) (items $?base))
    (sales (id ?id2) (items $? ?x $?))
    (test (not (member$ ?x $?target)))
    (test (not (member$ ?x $?base)))
    (test (member$ ?id2 $?member))
    =>
    (retract ?f2)
    (assert (recommend (id ?id1) (similar $?member) (items $?base ?x))))

(defrule find-similar-two-2
    (phase find-similar)
    ?f1 <- (same (pair ?id1 ?id2) (items $?target))
    ?f2 <- (recommend (id ?id1) (similar $?member) (items $?base))
    (sales (id ?id2) (items $? ?x $?))
    (test (not (member$ ?x $?target)))
    (test (not (member$ ?x $?base)))
    (test (not (member$ ?id2 $?member)))
    =>
    (retract ?f2)
    (assert (recommend (id ?id1) (similar $?member ?id2) (items $?base ?x))))

(defrule find-similar-two-3
    (phase find-similar)
    ?f1 <- (same (pair ?id1 ?id2) (items $?target))
    ?f2 <- (recommend (id ?id1) (similar $?member) (items $?base))
    (test (not (member$ ?id2 $?member)))
    =>
    (retract ?f2)
    (assert (recommend (id ?id1) (similar $?member ?id2) (items $?base))))

(defrule change-phase-2
    (declare (salience -10))
    (phase find-similar)
    =>
    (assert (phase output-file)))

(defrule output-file-00
    (declare (salience 20))
    (phase output-file)
    ?f1 <- (recommend (id ?id1) (similar $?member) (items $?t1 ?a1 $?t2 ?a2 $?t3))
    (test (> ?a1 ?a2))
    =>
    (retract ?f1)
    (assert (recommend (id ?id1) (similar $?member) (items $?t1 ?a2 $?t2 ?a1 $?t3))))

(defrule output-file-01
    (declare (salience 20))
    (phase output-file)
    ?f1 <- (recommend (id ?id1) (similar $?t1 ?a1 $?t2 ?a2 $?t3) (items ?item))
    (test (> ?a1 ?a2))
    =>
    (retract ?f1)
    (assert (recommend (id ?id1) (similar $?t1 ?a2 $?t2 ?a1 $?t3) (items ?item))))

(defrule output-file-02
    (declare (salience 10))
    (phase output-file)
    ?f1 <- (recommend (id ?id1) (similar $?member) (items $?items))
    =>
    (printout out ?id1 $?member ":" $?items crlf)
    (retract ?f1))

(defrule output-file-03
    (declare (salience 0))
    (phase output-file)
    =>
    (close out))
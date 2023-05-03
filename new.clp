(deftemplate sales(slot id)(multislot items))
(deftemplate record (slot id)(multislot pair))
(deftemplate combination (multislot pair)(slot number))

(deffacts initial(phase load-data))

(defrule assert-data
 (declare (salience 100))
    (phase load-data)
    =>
    (load-facts "C:\\cpe\\record-02.txt")
    (open "C:\\cpe\\recommend.txt" out "w")
)

(defrule generate-recommand
    (phase load-data)
    (sales (id ?id1) (items $? ?x $? ?y $?))
    =>
    (assert (record (id ?id1)(pair ?x ?y)))
    
)



(defrule change-phase-1
    (declare (salience -10))
    (phase load-data)
    =>
    (assert (phase find-similar)))

    


(defrule generate-recommand-1
    (phase find-similar)
    ?f<-(record (id $?)(pair ?x ?y))
    ?f1 <-(combination (pair ?x ?y)(number ?n))
    =>
    (retract ?f ?f1)
    (assert (combination (pair ?x ?y)(number (+ ?n 1))))
)


(defrule change-phase-1-1
    (declare (salience -20))
    (phase find-similar)
    =>
    (assert (phase find-big)))

(defrule big
    (phase find-big)
    ?f<-(combination (pair ?x ?y)(number ?c))
    ?g<-(combination (pair ?a ?b)(number ?d))
    (test (> ?c ?d))
    =>
    (retract ?g) 
)

(defrule change-phase-1-1-1
    (declare (salience -30))
    (phase find-big)
    =>
    (assert (phase output-file)))


(defrule output-file-02
    (declare (salience 10))
    (phase output-file)
    ?f1<-(combination (pair ?a ?b)(number ?d))
    =>
    (printout out ?a "," ?b ":" ?d crlf)
    (retract ?f1))

(defrule output-file-03
    (declare (salience 0))
    (phase output-file)
    =>
    (close out))




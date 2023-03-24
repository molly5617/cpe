(deftemplate sort (slot super) (slot sub))
(deftemplate relationship (multislot sort01) (multislot sort02)) 

(deffacts initial
    (sort (super Mammalia) (sub Primates))
    (sort (super Mammalia) (sub Artiodactyla))
    (sort (super Mammalia) (sub Rodentia))
    (sort (super Primates) (sub Cercopithecidae))
    (sort (super Primates) (sub Hominoidea))
    (sort (super Artiodactyla) (sub Cervidae))
    (sort (super Artiodactyla) (sub Bovidae))
    (sort (super Rodentia) (sub Sciuridae))
    (sort (super Cercopithecidae) (sub Macaca))
    (sort (super Cercopithecidae) (sub Papio))
    (sort (super Cercopithecidae) (sub Mandrillus))
    (sort (super Hominoidea) (sub Pongo))
    (sort (super Hominoidea) (sub Pan))
    (sort (super Hominoidea) (sub Homo))
    (sort (super Cervidae) (sub Rangifer))
    (sort (super Cervidae) (sub Elaphurus))
    (sort (super Bovidae) (sub Bison))
    (sort (super Bovidae) (sub Bubalus))
    (sort (super Sciuridae) (sub Tamias))
    (sort (super Macaca) (sub Sylvanus))
    (sort (super Macaca) (sub Cyclopis))
    (sort (super Papio) (sub Anubis))
    (sort (super Papio) (sub Ursinus))
    (sort (super Mandrillus) (sub Sphinx))
    (sort (super Mandrillus) (sub Leucophaeus))
    (sort (super Pongo) (sub Pygmaeus))
    (sort (super Pongo) (sub Abelii))
    (sort (super Pan) (sub Troglodytes))
    (sort (super Pan) (sub Paniscus))
    (sort (super Homo) (sub Sapiens))
    (sort (super Rangifer) (sub Tarandus))
    (sort (super Rangifer) (sub Caribou))
    (sort (super Elaphurus) (sub Davidianus))
    (sort (super Bison) (sub Athabascae))
    (sort (super Bison) (sub Bonasus))
    (sort (super Bubalus) (sub Arnee))
    (sort (super Tamias) (sub Ochrogenys))
    (phase input)
)

(defrule input
    (phase input)
    =>
    (printout t "Enter sort #1: ")
    (bind ?input1 (read))
    (printout t "Enter sort #2: ")
    (bind ?input2 (read))
    (assert (relationship (sort01 ?input1) (sort02 ?input2))))

(defrule change-phase1
    (declare (salience -10))
    ?f1 <- (phase input)
    =>
    (retract ?f1)
    (assert (phase erase1)))

(defrule change-phase2
    (declare (salience -20))
    ?f1 <- (phase erase1)
    =>
    (retract ?f1)
    (assert (phase erase2)))

(defrule change-phase3
    (declare (salience -30))
    ?f1 <- (phase erase2)
    =>
    (retract ?f1)
    (assert (phase final)))

(defrule change-phase4
    (declare (salience -40))
    ?f1 <- (phase final)
    =>
    (retract ?f1)
    (assert (phase final-output)))

(defrule change-phase5
    (declare (salience -50))
    ?f1 <- (phase final-output)
    =>
    (retract ?f1)
    (assert (phase input)))

(defrule erase1
    (phase erase1)
    ?old_relationship1 <- (relationship (sort01 ?p1 $?o1) (sort02 $?o2))
    (sort (super ?f1) (sub ?p1))
    =>
    (retract ?old_relationship1)
    (assert (relationship (sort01 ?f1 ?p1 $?o1) (sort02 $?o2))))

(defrule erase2
    (phase erase2)
    ?old_relationship1 <- (relationship (sort01 $?o1) (sort02 ?p2 $?o2))
    (sort (super ?f2) (sub ?p2))
    =>
    (retract ?old_relationship1)
    (assert (relationship (sort01 $?o1) (sort02 ?f2 ?p2 $?o2))))

(defrule final
    (phase final)
    ?old_relationship2 <- (relationship (sort01 ?e1 $?o1) (sort02 ?e1 $?o2))
    (sort (super ?e1) (sub $?))
    =>
    (retract ?old_relationship2)
    (assert (relationship (sort01 $?o1) (sort02 $?o2))))

(defrule final-output
    (phase final-output)
    ?old_relationship3 <- (relationship (sort01 $?sort01) (sort02 $?sort02))
    =>
    (retract ?old_relationship3)
    (printout t "The relationship distance is " (+ (length$ $?sort01) (length$ $?sort02)) crlf))

   
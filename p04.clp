(deftemplate sort(slot super)(slot sub))
(deftemplate relationship (multislot sort01)(multislot sort02))
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
(printout t "Enter sort#1:")
(bind ?input1(read))
(printout t "Enter sort#2:")
(bind ?input2(read))
(assert(relationship(sort01 ?input1)(sort02 ?input2)))
)

(defrule change-phase
(declare(salience -10))
?f1<-(phase input)
=>
(retract ?f1)
(assert(phase erase1)))

(defrule do-erase1
(phase erase1)
?f1<-(relationship(sort01 ?hello $?o1)(sort02 $?o2))
(sort(super ?hi)(sub ?hello))
=>
(retract ?f1)
(assert (relationship(sort01 ?hi ?hello $?o1)(sort02 $?o2)))
)


(defrule erase1
(declare(salience -20))
?f1<-(phase erase1)
=>
(retract ?f1)
(assert (phase erase2))
)

(defrule do-erase2
(phase erase2)
?f1<-(relationship(sort01 $?o1)(sort02 ?hello $?o2))
(sort(super ?hi)(sub ?hello))
=>
(retract ?f1)
(assert (relationship(sort01  $?o1)(sort02 ?hi ?hello $?o2)))
)

(defrule erase2
(declare(salience -30))
?f1<-(phase erase2)
=>
(retract ?f1)
(assert (phase erase3))
)

(defrule do-erase3
(phase erase3)
?f1<-(relationship(sort01 ?same $?o1)(sort02 ?same $?o2))
(sort(super ?same)(sub $?))
=>
(retract ?f1)
(assert (relationship(sort01 $?o1)(sort02 $?o2)))
)

(defrule erase3
(declare(salience -40))
?f1<-(phase erase3)
=>
(retract ?f1)
(assert (phase erase4))
)

(defrule do-erase4
(phase erase4)
?f1<-(relationship(sort01 $?o1)(sort02 $?o2))
=>
(retract ?f1)
(printout t "The relationship distance is "(+(length$ $?o1) (length$ $?o2))crlf)
)

(defrule erase4
(declare(salience -50))
?f1<-(phase erase4)
=>
(retract ?f1)
(assert (phase input))
)



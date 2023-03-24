(deftemplate sort (slot super)(slot sub))

(deftemplate relationship (multislot sort01)(multislot sort02))

(deffacts initial 
    (sort (super Mammalia)(sub Primates))
    (sort (super Mammalia)(sub Artiodactyla))
    (sort (super Mammalia)(sub  Rodentia))
    (sort (super Primates)(sub Cercopithecidae))
    (sort(super Primates)(sub Hominoidea))
    (sort (super Artiodactyla)(sub Cervidae))
    (sort (super Artiodactyla)(sub Bovidae))
    (sort (super Rodentia)(sub Sciuridae))
    (sort(super Cercopithecidae)(sub Macaca))
    (sort (super Cercopithecidae)(sun Papio))
    (sort(super Cercopithecidae)(sub Mandrillus))
    


    (sort(super Tamias)(sub Ochrogenys))
    (phase input)


)

(defrule input
    (phase input)
    =>
    (printout t "Enter sort #1: ")
    (bind ?input1 (read))
    (printout t "Enter sort #2: ")
    (bind ?input2 (read))
    (assert(relationship(sort01 ?input)(sort02 ?input2)))
)

(defrule change-phase
    (declare (salience -10))
    ?f1 <-(phase input)
    =>
    (retract ?f1)
    (assert(phase erase)))
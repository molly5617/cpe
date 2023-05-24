(deftemplate relative (slot parent)(multislot child))
(deftemplate person (slot name)(slot gender)(slot alive)(slot after2013))
(deftemplate inheritance(multislot priority))
(deffacts initial-fact 
   (relative (parent GeorgeVI) (child Elizabeth Margaret))
   (relative (parent Elizabeth) (child Jane Charles Anne Andrew Edward))
   (relative (parent Charles) (child William Henry))
   (relative (parent William) (child Mary George Emma Charlotte Louis Carlo))
   (relative (parent Emma) (child Linda Steve))
   (relative (parent Linda) (child Paul))
   (relative (parent Louis) (child Carl John))
   (relative (parent Henry) (child Archie Lilibet))
   (relative (parent Anne) (child Peter Zara))
   (relative (parent Peter) (child Savannah Isla))
   (relative (parent Zara) (child Mia Lena Lucas Helen))
   (relative (parent Lucas) (child Robert))
   (relative (parent Andrew) (child Beatrice Eugenie))
   (relative (parent Beatrice) (child Sienna))
   (relative (parent Eugenie) (child August))
   (relative (parent Edward) (child Louise James))
   (relative (parent Margaret) (child David Sarah))
   (relative (parent David) (child Charlie Margarita))
   (person (name GeorgeVI) (gender M) (alive no) (after2013 no))
   (person (name Elizabeth) (gender F) (alive yes) (after2013 no))
   (person (name Margaret) (gender F) (alive no) (after2013 no))
   (person (name Jane) (gender F) (alive yes) (after2013 no))
   (person (name Charles) (gender M) (alive yes) (after2013 no))
   (person (name Anne) (gender F) (alive yes) (after2013 no))
   (person (name Andrew) (gender M) (alive no) (after2013 no))
   (person (name Edward) (gender M) (alive yes) (after2013 no))
   (person (name William) (gender M) (alive yes) (after2013 no))
   (person (name Henry) (gender M) (alive yes) (after2013 no))
   (person (name Mary) (gender F) (alive yes) (after2013 no))
   (person (name George) (gender M) (alive yes) (after2013 no))
   (person (name Emma) (gender F) (alive yes) (after2013 no))
   (person (name Charlotte) (gender F) (alive yes) (after2013 no))
   (person (name Louis) (gender M) (alive yes) (after2013 no))
   (person (name Carlo) (gender F) (alive yes) (after2013 no))
   (person (name Linda) (gender F) (alive yes) (after2013 no))
   (person (name Steve) (gender M) (alive yes) (after2013 yes))
   (person (name Paul) (gender M) (alive yes) (after2013 yes))
   (person (name Carl) (gender M) (alive yes) (after2013 yes))
   (person (name John) (gender M) (alive yes) (after2013 yes))
   (person (name Archie) (gender M) (alive yes) (after2013 no))
   (person (name Lilibet) (gender F) (alive yes) (after2013 no))
   (person (name Peter) (gender M) (alive yes) (after2013 no))
   (person (name Zara) (gender F) (alive yes) (after2013 no))
   (person (name Savannah) (gender F) (alive yes) (after2013 no))
   (person (name Isla) (gender F) (alive yes) (after2013 no))
   (person (name Mia) (gender F) (alive yes) (after2013 no))
   (person (name Lena) (gender F) (alive yes) (after2013 no))
   (person (name Lucas) (gender M) (alive yes) (after2013 yes))
   (person (name Helen) (gender F) (alive yes) (after2013 yes))
   (person (name Robert) (gender M) (alive yes) (after2013 yes))
   (person (name Beatrice) (gender F) (alive yes) (after2013 no))
   (person (name Eugenie) (gender F) (alive yes) (after2013 no))
   (person (name Sienna) (gender F) (alive yes) (after2013 no))
   (person (name August) (gender M) (alive yes) (after2013 no))
   (person (name Louise) (gender F) (alive yes) (after2013 no))
   (person (name James) (gender M) (alive yes) (after2013 no))
   (person (name David) (gender M) (alive yes) (after2013 no))
   (person (name Sarah) (gender F) (alive yes) (after2013 no))
   (person (name Charlie) (gender M) (alive yes) (after2013 no))
   (person (name Margarita) (gender F) (alive yes) (after2013 no))
   (king-or-queen Elizabeth)
   (inheritance (priority))
   (number 1)

(phase master)
)

(defrule two-zero-one-three

(declare (salience 100))
(phase master)
?f<-(relative (parent ?a1) (child $?a ?b $?c ?d $?e))
(person (name ?b) (gender F)  (after2013 no))
(person (name ?d) (gender M)  (after2013 no))
=>
(retract ?f)
(assert (relative (parent ?a1) (child $?a ?d ?b $?c $?e)))
)


(defrule child-parent
(declare (salience -10))
?f3<-(phase master)
(king-or-queen ?a)
?f2<-(inheritance(priority))
(relative (parent ?a1) (child $? ?a $?))
=>
(retract  ?f2 ?f3)
(assert (inheritance(priority ?a1)))
(assert (phase double-shark))
)

(defrule double
(phase double-shark)
?f1<-(inheritance(priority $?p1 ?p $?p2))
?f2<-(relative (parent ?p) (child $?c))
=>
(retract ?f1 ?f2)
(assert(inheritance(priority $?p1 ?p $?c $?p2)))
)

(defrule priority-dead
(phase double-shark)
?f1<-(inheritance(priority $?p1 ?p $?p2))
(person (name ?p)(alive no))
=>
(retract ?f1)
(assert (inheritance(priority $?p1 $?p2))

))


(defrule dkq
(phase double-shark)
?f1<-(inheritance(priority $?p1 ?p $?p2))
(king-or-queen ?p)
=>
(retract ?f1)
(assert (inheritance(priority $?p1 $?p2)))
)

(defrule power
(declare(salience -10))
(phase double-shark)
?f1<-(number ?n)
?f2<-(inheritance(priority ?p1 $?p2))

=>
(retract ?f1 ?f2)
(assert (inheritance(priority $?p2)))
(printout t ?n " " ?p1 crlf)
(assert (number (+ 1 ?n)))
)











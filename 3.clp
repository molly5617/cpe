(deftemplate permutation
   (multislot values)
   (multislot rest))

(defrule start-permuations
  (base-fact $?begin ?middle $?end)
  =>
  (assert (permutation (values ?middle)
                       (rest ?end ?begin))))

(defrule continue-permutations
  (permutation (values $?done)
               (rest $?begin ?middle $?end))
  =>
  (assert (permutation (values ?done ?middle)
                       (rest ?begin ?end)))
   
)
   

(defrule print-permutation
   ?hello<-(permutation (values $?done) (rest))
   ?goal<-(total ?value)
   =>
   (retract ?goal ?hello)
   (printout t "Permutation is " ?done crlf) 
   (assert(total(+ 1 ?value)))
          
)

(defrule print-sum
   (declare (salience -10000))
   (total ?value)
   =>
   (printout t "The total number is " ?value crlf) 
          
)



(deffacts initial (total 0))

(defrule read-base-fact
    (declare (salience 100))
    =>
    (printout t "Please input a base fact for the permutation ...")
    (bind ?input (explode$ (readline)))
    (assert(permutation(values)(rest ?input))))

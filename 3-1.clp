(deftemplate permutation
   (multislot values)
   (multislot rest))

(defrule start-permuations
  (permutation (values $?V)
                       (rest $?A1 ?A $?A2))
  =>
  
  (assert (permutation (values $?V ?A)
                       (rest $?A1 $?A2)))            
)
        


   

(defrule print-permutation
   ?hello<-(permutation (values $?A) (rest))
   ?goal<-(total ?value)
   =>
   (retract ?goal ?hello)
   (printout t "Permutation is " ?A crlf) 
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

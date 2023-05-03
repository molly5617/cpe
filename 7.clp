(deftemplate binary-#
  (multislot name)
  (multislot digits))

(deftemplate binary-adder
  (multislot name-1)
  (multislot name-2)
  (slot carry)
  (multislot #-1)
  (multislot #-2)
  (multislot result))

(deftemplate add-binary-#s
  (multislot name-1)
  (multislot name-2))

(deffacts test
  (binary-# (name A) (digits 1 0 1 1 1))
  (binary-# (name B) (digits 1 1 1 0))
  (add-binary-#s (name-1 A) (name-2 B)))

(defrule input-amount
    (phase input-amount)
    =>
    (printout t "Please input the amount of binary numbers to be added:")
    
    )

(defrule create-adder
  (add-binary-#s (name-1 $?n1) (name-2 $?n2))
  (binary-# (name $?n1) (digits $?d1))
  (binary-# (name $?n2) (digits $?d2))

  =>
  (assert (binary-adder (name-1 ?n1)
                        (name-2 ?n2)
                        (carry 0)
                        (#-1 ?d1)
                        (#-2 ?d2)
(result))))




(defrule adder-case-1-and-2
  ?f <- (binary-adder (carry ?c)
                      (#-1 $?n1 0)
                      (#-2 $?n2 0)
                      (result $?r))
  =>
  (modify ?f (carry 0) (result ?c ?r) (#-1 ?n1) (#-2 ?n2)))

(defrule adder-case-3-and-4
  ?f <- (binary-adder (carry ?c)
                      (#-1 $?n1 1)
                      (#-2 $?n2 1)
                      (result $?r))
  =>
  (modify ?f (carry 1) (result ?c ?r) (#-1 ?n1) (#-2 ?n2)))

(defrule adder-case-5-and-6
  ?f <- (binary-adder (carry 0)
                      (#-1 $?n1 ?v)
                      (#-2 $?n2 ~?v)
                      (result $?r))
  =>
  (modify ?f (carry 0) (result 1 ?r) (#-1 ?n1) (#-2 ?n2)))

(defrule adder-case-7-and-8
  ?f <- (binary-adder (carry 1)
                      (#-1 $?n1 ?v)
                      (#-2 $?n2 ~?v)
                      (result $?r))
  =>
  (modify ?f (carry 1) (result 0 ?r) (#-1 ?n1) (#-2 ?n2)))

(defrule adder-case-9
  ?f <- (binary-adder (carry ?c)
                      (#-1 $?n1 0)
                      (#-2)
                      (result $?r))
  =>
  (modify ?f (carry 0) (result ?c ?r) (#-1 ?n1)))

(defrule adder-case-10
  ?f <- (binary-adder (carry ?c)
                      (#-1)
                      (#-2 $?n2 0)
                      (result $?r))
  =>
  (modify ?f (carry 0) (result ?c ?r) (#-2 ?n2)))

(defrule adder-case-11
  ?f <- (binary-adder (carry 0)
                      (#-1 $?n1 1)
                      (#-2)
                      (result $?r))
 =>
  (modify ?f (carry 0) (result 1 ?r) (#-1 ?n1)))

(defrule adder-case-12
  ?f <- (binary-adder (carry 0)
                      (#-1)
                      (#-2 $?n2 1)
                      (result $?r))
  =>
  (modify ?f (carry 0) (result 1 ?r) (#-2 ?n2)))

(defrule adder-case-13
  ?f <- (binary-adder (carry 1)
                      (#-1 $?n1 1)
                      (#-2)
                      (result $?r))
  =>
  (modify ?f (carry 1) (result 0 ?r) (#-1 ?n1)))
(defrule adder-case-14
  ?f <- (binary-adder (carry 1)
                      (#-1)
                      (#-2 $?n2 1)
                      (result $?r))
  =>
  (modify ?f (carry 1) (result 0 ?r) (#-2 ?n2)))

(defrule adder-case-15
  ?f <- (binary-adder (carry 1)
                      (#-1)
                      (#-2)
                      (result $?r))
  =>
  (modify ?f (carry 0) (result 1 ?r)))

(defrule convert-adder-to-number
  ?f1 <- (add-binary-#s (name-1 $?n1) (name-2 $?n2))
  ?f2 <- (binary-adder (name-1 $?n1)
                       (name-2 $?n2) 
                       (carry 0)
                       (#-1)
                       (#-2)
                       (result $?r))
  =>
  (retract ?f1 ?f2)
  (assert (binary-# (name { ?n1 + ?n2 })
                    (digits ?r))))


(load "C:\\Users\\user\\OneDrive - ???ç«?å½°å??å¸«ç??å¤§å­¸\\æ¡???¢\\7.txt")
(deftemplate conversion (slot character) (multislot morse-code))
(deftemplate translation (multislot string) (multislot code)) 

(deffacts conversions
   (conversion (character A) (morse-code * -))
   (conversion (character B) (morse-code - * * *))
   (conversion (character C) (morse-code - * - *))
   (conversion (character D) (morse-code - * *))
   (conversion (character E) (morse-code *))
   (conversion (character F) (morse-code * * - *))
   (conversion (character G) (morse-code - - *))
   (conversion (character H) (morse-code * * * *))
   (conversion (character I) (morse-code * *))
   (conversion (character J) (morse-code * - - -))
   (conversion (character K) (morse-code - * -))
   (conversion (character L) (morse-code * - * *))
   (conversion (character M) (morse-code - -))
   (conversion (character N) (morse-code - *))
   (conversion (character O) (morse-code - - -))
   (conversion (character P) (morse-code * - - *))
   (conversion (character Q) (morse-code - - * -))
   (conversion (character R) (morse-code * - *))
   (conversion (character S) (morse-code * * *))
   (conversion (character T) (morse-code -))
   (conversion (character U) (morse-code * * -))
   (conversion (character V) (morse-code * * * -))
   (conversion (character W) (morse-code * - -))
   (conversion (character X) (morse-code - * * -))
   (conversion (character Y) (morse-code - * - -))
   (conversion (character Z) (morse-code - - * *))
)

(defrule get-message
    (not (translation (string $?) (code $?)))
    =>
    (printout t "Enter a message (<Enter> to end): ")
    (bind ?input (explode$(readline)))
    (assert (translation (string) (code ?input))))

(defrule end
    (translation (string) (code))
    =>
    (halt))

(defrule trans-message1
    (declare (salience -10))
    ?old_translation <- (translation (string $?str1) (code $?str2 ?slash $?element))
    (test (eq ?slash /))
    (conversion (character ?type) (morse-code $?element))
    =>
    (retract ?old_translation)
    (assert (translation (string ?type $?str1) (code $?str2))))

(defrule trans-message2
    (declare (salience -20))
    ?old_translation <- (translation (string $?str1) (code $?element))
    (conversion (character ?type) (morse-code $?element))
    =>
    (retract ?old_translation)
    (printout t "The message is " ?type " " (implode$ $?str1) crlf))

(defrule check-message
    (declare (salience -30))
    ?old_translation <- (translation (string $?) (code $?))
    =>
    (retract ?old_translation)
    (printout t "Can't decode this message." crlf))
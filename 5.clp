(deftemplate conversion
   (slot character)
   (multislot morse-code))

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
   (conversion (character Z) (morse-code - - * *)))

(defrule get-message
   (not (message $?))
   =>
   (printout t "Enter a message (<CR> to end): ")
   (bind ?input (readline))
   (assert-string (str-cat "(message " ?input ")"))
   (assert (translation)))

(defrule end
   ?f1 <- (message)
   ?f2 <- (translation)
   =>
   (retract ?f1 ?f2)
   (halt))

(defrule bad-message-1
   (or ?f1 <- (message $? ~/&~*&~- $?)
       ?f1 <- (message / $?)
       ?f1 <- (message $? /)
       ?f1 <- (message $? / / $?))
   ?f2 <- (translation $?)
   =>
   (retract ?f1 ?f2)
   (printout t "Can't decode this message." crlf))

(defrule bad-message-2
   (or ?f1 <- (message $?first)
       ?f1 <- (message $?first / $?))
   (not (conversion (morse-code $?first)))
   (test (and (neq (length$ ?first) 0)
              (not (member / ?first))))
   ?f2 <- (translation $?)
   =>
   (retract ?f1 ?f2)
   (printout t "Can't decode this message." crlf))

(defrule convert-1
   ?f1 <- (message $?first / $?rest)
   (conversion (character ?value) (morse-code $?first))
   ?f2 <- (translation $?translation)
   =>
   (retract ?f1 ?f2)
   (assert (message ?rest))
   (assert (translation ?translation ?value)))

(defrule convert-2
   ?f1 <- (message $?first)
   (conversion (character ?value) (morse-code $?first))
   ?f2 <- (translation $?translation)
   =>
   (retract ?f1 ?f2)
   (assert (message))
   (assert (translation ?translation ?value)))

(defrule print-translation
   ?f1 <- (message)
   ?f2 <- (translation $?translation)
   =>
   (retract ?f1 ?f2)
   (printout t "The message is " 
               (str-implode ?translation) crlf))

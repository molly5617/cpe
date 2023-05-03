(deftemplate conversion (slot character)(multislot morse-code))
(deftemplate translation (multislot string)(multislot code))

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
    (not (translation(string $?)(code $?)))
    =>
    (printout t "Enter a message (<Enter> to end):")
    (bind ?input(explode$ (readline)))
    (assert (translation (string)(code ?input)))
)

(defrule end
    (translation(string)(code))
    =>
    (halt))

(defrule error
    (or ?f1<-(translation (string $?)(code / $?))
        ?f1<-(translation (string $?)(code $? /))
        ?f1<-(translation (string $?)(code $? / / $?))
        ?f1<-(translation (string $?)(code $? ~/&~*&~- $?))
    )
    =>
    (retract ?f1)
    (printout t "Can't decode this message." crlf)  
)

(defrule error-1
    (or ?f1<-(translation (string $?)(code $?hello))
        ?f1<-(translation (string $?)(code $?hello / $?))
    )
    (not (conversion(character ?p1)(morse-code $?hello)))
    (test (and (neq (length$ ?hello) 0)
               (not (member / ?hello))))
    =>
    (retract ?f1)
    (printout t "Can't decode this message." crlf)  
)

(defrule transfer-1
    ?f1<-(translation (string $?p3)(code $?p1 / $?p2))
    (conversion (character ?ans)(morse-code $?p1))
    =>
    (retract ?f1)
    (assert(translation (string $?p3 ?ans)(code $?p2)))
)

(defrule transfer-2
    ?f1<-(translation (string $?p3)(code $?p1))
    (conversion (character ?ans)(morse-code $?p1))
    =>
    (retract ?f1)
    (assert(translation (string $?p3 ?ans)(code)))
)

(defrule print-translation
   
   ?f1 <- (translation(string $?translation)(code))
   =>
   (retract ?f1)
   (printout t "The message is " 
               (implode$ $?translation) crlf))








(load "C:\\Users\\user\\OneDrive - 國立彰化師範大學\\桌面\\7.txt")
(load "C:\\Users\\user\\OneDrive - 國立彰化師範大學\\桌面\\4.txt")



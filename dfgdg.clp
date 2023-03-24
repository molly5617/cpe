(deftemplate person (slot name)(slot eyes)(slot hair))
(defrule find-blue-eyes(person (name ?name)(eyes blue))
=>
(printout t ?name " has blue eyes." crlf)
)

(deffacts people
(person (name Jane)(eyes blue)(hair red))
(person(name Joe)(eyes green)(hair brown))
(person (name Jack)(eyes blue)(hair black))
(person(name Jeff)(eyes green)(hair brown))
)

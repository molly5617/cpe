(deftemplate breaked (slot type))
(deftemplate breaked-info (slot info))

(defrule check-brake-trouble
	(or (breaked-info (info noise-when-brake)) 
	    (breaked-info (info noise-from-tire)))
	=>
	(assert (breaked (type brake-trouble))))

(defrule check-water-tank-trouble
	(or (breaked-info (info water-thermometer-H)) 
	    (breaked-info (info water-leak)))
	=>
	(assert (breaked (type water-tank-trouble))))

(defrule check-engine-belt-loose
	(breaked-info (info noise-from-engine-room))
	=>
	(assert (breaked (type engine-belt-loose))))

(defrule check-car-battery-no-power
	(breaked-info (info engine-cannot-catch))
	=>
	(assert (breaked (type car-battery-no-power))))


(defrule deal-brake-trouble
	(breaked (type brake-trouble))
	=>
	(printout t "check brake pedal and oil" crlf))

(defrule deal-water-tank-trouble
	(breaked (type water-tank-trouble))
	=>
	(printout t "repair the water tank or add water" crlf))

(defrule deal-engine-belt-loose
	(breaked (type engine-belt-loose))
	=>
	(printout t "change the engine belt" crlf))

(defrule deal-car-battery-no-power
	(breaked (type car-battery-no-power))
	=>
	(printout t "replace or change a car battery" crlf))
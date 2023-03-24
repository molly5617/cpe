(deftemplate person (slot name)(slot sex))
(deftemplate parent-children(multislot parent)(multislot children))
(deftemplate pair(slot husband)(slot wife))
(deftemplate query(slot name)(slot subject))
(deffacts initial
    (person(name John)(sex male))
    (person(name Peter)(sex male))
    (person(name David)(sex male))
    (person (name Joe)(sex male))
    (person (name Kevin)(sex male))
    (person(name Mary)(sex female))
    (person(name Sue)(sex female))
    (person(name Linda)(sex female))
    (person(name Sherry)(sex female))
    (person(name John)(sex female))
    (pair (husband John)(wife Sue))
    (pair(husband David)(wife Linda))
    (pair(husband Peter)(wife sherry))
    (parent-children(parent John Sue)(children Mary Kevin))
    (parent-children (parents Peter Sherry)(children John Linda))
    (parent-children(parent David Linda)(children Joe))
    (query (name Mary)(subject))
    
    
    
    
    
    
)
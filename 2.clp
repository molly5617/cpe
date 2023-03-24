(deftemplate person(slot name)(slot sex))
(deftemplate parent-children (multislot parent)(multislot children))
(deftemplate pair(slot husband)(slot wife))
(deftemplate query(slot name)(slot subject))
(deffacts initial
    (person (name John)(sex male))
    (person (name Peter)(sex male))
    (person (name David)(sex male))
    (person (name Joe)(sex male))
    (person (name Kevin)(sex male))
    (person (name Mary)(sex female))
    (person (name Sue)(sex female))
    (person (name Linda)(sex female))
    (person (name Sherry)(sex female))
    (pair (husband John)(wife Sue))
    (pair (husband David)(wife Linda))
    (pair (husband Peter)(wife Sherry))
    (parent-children (parent John Sue)(children Mary Kevin))
    (parent-children (parent Peter Sherry)(children John Linda))
    (parent-children(parent David Linda)(children Joe))
    (query (name Mary)(subject Kevin))
    (query (name Sue)(subject Kevin))
    (query (name Peter)(subject Kevin))
    (query (name David)(subject Kevin))
    (query (name Linda)(subject Kevin))
    (query (name Joe)(subject Kevin))
    (query (name Sherry)(subject Kevin))  
    (query (name John)(subject Kevin))  

    (query (name Mary)(subject Joe))
    (query (name Sue)(subject Joe))
    (query (name Peter)(subject Joe))
    
    (query (name David)(subject Joe))
    (query (name Linda)(subject Joe))
    (query (name Kevin)(subject Joe))
    (query (name Sherry)(subject Joe))  
    (query (name John)(subject Joe)) 
    (query (name Joe)(subject Mary))
    (query (name Sue)(subject Mary))
    (query (name Peter)(subject Mary))
    
    (query (name David)(subject Mary))
    (query (name Linda)(subject Mary))
    (query (name Kevin)(subject Mary))
    (query (name Sherry)(subject Mary))  
    (query (name John)(subject Mary)) 

    (query (name Sherry)(subject John)) 
    (query (name Peter)(subject John)) 
    (query (name Linda)(subject John))

    (query (name Peter)(subject Linda)) 
    (query (name Sherry)(subject Linda)) 
    (query (name John)(subject Linda)) 
)

(defrule define-brother
    (query (name ?p1)(subject ?p2))
    (or (parent-children(parent $?)(children $? ?p1 $? ?p2 $?))
    (parent-children (parent $?)
    (children $? ?p2 $? ?p1 $?)))
    (person (name ?p1)(sex male))
    =>
    (printout t ?p1 " is "?p2 "'s brother."crlf)    
)

(defrule define-sister
    (query (name ?p1)(subject ?p2))
    (or(parent-children(parent $?)(children $? ?p1 $? ?p2 $?))
    (parent-children (parent $?)
    (children $? ?p2 $? ?p1 $?)))
    (person (name ?p1)(sex female))
    =>
    (printout t ?p1 " is "?p2 "'s sister."crlf)    
)
(defrule define-mother
    (query (name ?p1)(subject ?p2))
    (parent-children(parent $? ?p1 $?)(children  $? ?p2 $? ))
    (person (name ?p1)(sex female))
    =>
    (printout t ?p1 " is "?p2 "'s mother."crlf)    
)

(defrule define-father
    (query (name ?p1)(subject ?p2))
    (parent-children(parent $? ?p1 $?)(children  $? ?p2 $?))
    (person (name ?p1)(sex male))
    =>
    (printout t ?p1 " is "?p2 "'s father."crlf)    
)

(defrule define-grandfather
    (query (name ?p1)(subject ?p2))  
    (parent-children(parent $? ?p3 $? )(children  $? ?p2 $?))
    (parent-children(parent $? ?p1 $? )(children  $? ?p3 $?))
    (person (name ?p1)(sex male))
    =>
    (printout t ?p1 " is "?p2 "'s grandfather."crlf)    
)


(defrule define-grandmother
    (query (name ?p1)(subject ?p2))  
    (parent-children(parent $? ?p3 $? )(children  $? ?p2 $?))
    (parent-children(parent $? ?p1 $? )(children  $? ?p3 $?))
    (person (name ?p1)(sex female))
    =>
    (printout t ?p1 " is "?p2 "'s grandmother."crlf)    
)

(defrule define-uncle "john to joe"
    (query (name ?p1)(subject ?p2)) 
    (pair (husband ?p1)(wife ?p3)) 
    (parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p1 $? ?p6 $?)) 
    (parent-children(parent $? ?p6 $? )(children  $? ?p2 $?)) 
    
    (person (name ?p1)(sex male))
    =>
    (printout t ?p1 " is "?p2 "'s uncle."crlf)      
)

(defrule define-uncle-1 "david to kevin"
    (query (name ?p1)(subject ?p2)) 
    (pair (husband ?p1)(wife ?p3)) 
    (or(parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p3 $? ?p6 $?)) 
    (parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p6 $? ?p3 $?)))
    (parent-children(parent $? ?p6 $? )(children  $? ?p2 $?)) 
    (person (name ?p1)(sex male))
    =>
    (printout t ?p1 " is "?p2 "'s uncle."crlf)      
)

(defrule define-aunt "joe to sue"
    (query (name ?p1)(subject ?p2)) 
    (pair (husband ?p3)(wife ?p1)) 
    (parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p3 $? ?p6 $?)) 
    (parent-children(parent $? ?p6 $? )(children  $? ?p2 $?)) 
    
    (person (name ?p1)(sex female))
    =>
    (printout t ?p1 " is "?p2 "'s aunt."crlf)    
)

(defrule define-aunt-1 "linda to kevin"
    (query (name ?p1)(subject ?p2)) 
    (pair (husband ?p3)(wife ?p1)) 
    (or(parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p1 $? ?p6 $?)) 
    (parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p6 $? ?p1 $?)) )
    (parent-children(parent $? ?p6 $? )(children  $? ?p2 $?)) 
    
    (person (name ?p1)(sex female))
    =>
    (printout t ?p1 " is "?p2 "'s aunt."crlf)     
)

(defrule define-cousin
    (query (name ?p1)(subject ?p2))  
    (parent-children(parent $? ?p3 $? )(children  $? ?p1 $?))
    (or(parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p3 $? ?p7 $?))
    (parent-children(parent $? ?p4 $? ?p5 $? )(children  $? ?p7 $? ?p3 $?)))
    
    (parent-children(parent $? ?p7 $? )(children  $? ?p2 $?))
    
    =>
    (printout t ?p1 " is "?p2 "'s cousin."crlf)    
)













(load "C:\\Users\\user\\OneDrive - 國立彰化師範大學\\桌面\\123.txt")
"C:\\Users\\user\\OneDrive - 國立彰化師範大學\\桌面\\6.txt"
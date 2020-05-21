# powerful digit sum
(de p56 ()
   (and 
      (make
         (for X 99
            (for Y 99
               (link (** X Y)) ) ) )
      (mapcar add-digits @)
      (sort @ >)
      (car @) ) )

(de add-digits (N)
   (apply + (mapcar any (chop N))) )

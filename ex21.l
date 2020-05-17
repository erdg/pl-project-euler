# amicable numbers
(load "utils.l")

(de ex21 ()
   (sum + 
      (filter 
         amicable? 
         (range 1 9999) ) ) )

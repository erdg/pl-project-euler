(load "utils.l")

(de ex07 () 
   (car
      (nth 
         (filter prime? (range 1 110000))
         10001 ) ) )

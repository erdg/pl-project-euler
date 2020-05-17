(load "utils.l")

(de ex10 ()
#  (sum + (filter prime? (range 1 2000000)))
   (sum + 
      # skip the even numbers for speed
      (cons 
         2 
         (filter prime? (range 3 2000000 2)) ) ) )

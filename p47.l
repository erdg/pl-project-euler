# distinct prime factors

# takes roughly 20 seconds
(de p47 ()
   (car 
      (filter
         '((N)
            (and 
               (>= (length (uniq (prime-factors N))) 4)
               (>= (length (uniq (prime-factors (+ N 1)))) 4)
               (>= (length (uniq (prime-factors (+ N 2)))) 4)
               (>= (length (uniq (prime-factors (+ N 3)))) 4) ) )
         (range 1 1000000) ) ) )

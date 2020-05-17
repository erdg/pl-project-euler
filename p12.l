# highly divisible triangular number
(load "utils.l")

(de p12 ()
   (let N 0
      (loop
         (T 
            (< 500 
               (number-of-factors 
                  (triangle-number (inc 'N) ) ) )
            (triangle-number N) ) ) ) )


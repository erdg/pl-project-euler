(de ex14 ()
   (let N (maxi 
             '((N) (length (hailstone N)))
             (range 1 999999) )
      (prinl N " " (length (hailstone N)))))

(de hailstone (N)
   (make
      (until (= 1 (link N))
         (setq N
            (if (bit? 1 N)
               (inc (* N 3))
               (/ N 2) ) ) ) ) )



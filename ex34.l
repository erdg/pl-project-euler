(de ex34 ()
   (sum +
      (make
         (for N (range 3 1000000)  # 1 and 2 don't count
            (when (= N (sum-of-digit-factorials N))
               (link N) ) ) ) ) )

(de ex34% ()
   (sum +
      (filter
         '((N) (= N (sum-of-digit-factorials N)))
         (range 3 100000) ) ) )

(de sum-of-digit-factorials (N)
   (sum + 
      (mapcar 
         '((I) 
            (if (=0 I) 
               1 
               (apply * (range 1 I)) ) )
         (mapcar any (chop N)) ) ) )  # 145 -> (1 4 5)

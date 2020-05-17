(load "utils.l")

(de ex02 ()
   (apply +
      (filter
         '((N) (and (<= N 4000000) (even? N)))
         (mapcar fib (range 1 40)) ) ) )

(de ex02-1 ()
   (let (N 0 Sum 0)
      (loop
         (inc 'N)
         (if (even? (fib N))
            (inc 'Sum @) )
         (T (>= (fib N) 4000000) Sum) ) ) )

(de ex02-2 ()
   (sum +
      (make
         (for N 40
            (when (and (even? (fib N)) (< @ 4000000))
               (link (fib N)) ) ) ) ) )


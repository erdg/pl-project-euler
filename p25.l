(load "utils.l")

(de p25 ()
   (let N 1
      (loop
         (T (= 1000 (length (fib (inc 'N)))) N) ) ) )

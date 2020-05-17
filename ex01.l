(de ex01 (N)
   (sum +
      (filter 
         '((N) (or (=0 (% N 3)) (=0 (% N 5))))
         (range 1 N) ) ) )

(de ex01-2 (N)
   (apply +
      (make
         (for I N
            (when (or (=0 (% I 3)) (=0 (% I 5))) 
               (link I)) ) ) ) )

(de ex01-3 (N)
   (let Sum 0
      (for I N
         (when (or (=0 (% I 3)) (=0 (% I 5)))
            (inc 'Sum I) ) )
      Sum ) )

# geometric approach
(de ex01-4 () 
   (+
      (sumDivisibleBy 3 999) 
      (sumDivisibleBy 5 999)
      (- (sumDivisibleBy 15 999)) ) )

(de sumDivisibleBy (N P)
   (/ (* N (/ P N) (+ (/ P N) 1)) 2) )

# utility functions for Project Euler
(load "@lib/math.l" "@lib/simul.l")

# if even, return N, else NIL
(de even? (N)
   (when (=0 (% N 2))
      N ) )

# if odd, return N, else NIL
(de odd? (N)
   (when (n0 (% N 2))
      N ) )

# fibonacci
(de fib (N) 
   (cache '(NIL) N
      (if (>= 2 N)
         1
         (+ (fib (dec N)) (fib (- N 2))) ) ) )

(de collatz (N)
   (make 
      (link N)
      (recur (N)
         (if (=1 N)
            (made)
            (if (even? N)
               (recurse (link (/ N 2)))
               (recurse (link (+ (* 3 N) 1))) ) ) ) ) )

(de length-of-collatz (N)
   (let I 1
      (loop
         (T (=1 N) I)
         (inc 'I)
         (if (even? N)
            (setq N (/ N 2))
            (setq N (+ (* 3 N) 1)) ) ) ) )
      

(de collatz-cache (N)
   (cache '(NIL) N
      (collatz N) ) )

(de next-collatz (N)
   (cache '(NIL) N
      (if (=1 N)
         1
         (if (even? N)
            (/ N 2)
            (+ (* 3 N) 1) ) ) ) )

# prime factors
(de factor (N)
   (make
      (let [D 2
            L (1 2 2 . (4 2 4 2 4 6 2 6 .))
            M (sqrt N) ]
         (while (>= M D)
            (if (=0 (% N D))
               (setq M (sqrt (setq N (/ N (link D)))))
               (inc 'D (pop 'L)) ) )
         (link N) ) ) )

# prime factors
(de prime-factors (N)
   (make
      (let [D 2
            L (1 2 2 . (4 2 4 2 4 6 2 6 .))
            M (sqrt N) ]
         (while (>= M D)
            (if (=0 (% N D))
               (setq M (sqrt (setq N (/ N (link D)))))
               (inc 'D (pop 'L)) ) )
         (link N) ) ) )


# least common multiple
# https://en.m.wikipedia.org/wiki/Least_common_multiple
# - calculation
# --- using prime factorization
# FIXME - this is fucked! It gives the right answer for some
# numbers and wrong answer for others. what a waste of a couple
# hours!
(de lcm% Nums
   (and 
      (make  # list of prime factors for each number
         (for N Nums  # grouped by common factors
            (link  # <- e.g. (("2" "2" "2") ("3" "3") ("7"))
               (by name group 
                  (mapcar pack (prime-factors N)) ) ) ) )
      (make  # get highest power for each number
         (for Lst @
            (if (sublists-same-length? Lst)
               (link (last Lst))
               (link 
                  (find
                     '((L1 L2) (> (length L1) (length L2)))
                     Lst ) ) ) ) )
      #(fish atom @)
      (mapcar '((L) (mapcar any L)) @)
      (mapcar '((L) (apply * L)) @)
      (apply * @) ) )

(de sublists-same-length? (Lst)
   (let Len (length (car Lst))
      (fully '((L) (= (length L) Len)) Lst) ) )

(de gcd (A B)
   (until (=0 B)
      (let M (% A B)
         (setq A B B M) ) )
   (abs A) )

(de lcm (A B)
   (abs (*/ A B (gcd A B))) )

# palindrome
(de pal? (N)
   (and
      (= N (any (pack (reverse (chop N)))))
      N ) )

(de factors (N)
   (filter 
      '((D) (=0 (% N D)))
      (range 1 N) ) )

# much faster than (length (factors N))
(de number-of-factors (N)
   (let 
      PrimeFactors # <- e.g. (("2" "2" "2") ("3"))
      (by name group (mapcar pack (prime-factors N)))
      (apply * 
         (mapcar '((Lst) (+ (length Lst) 1))
            PrimeFactors ) ) ) )

(de triangle-number (N)
   (/ (* N (+ N 1))
      2 ) )

(de pentagonal-number (N)
   (/ (* N (- (* 3 N) 1))
      2 ) )

(de hexagonal-number (N)
   (* N (- (* 2 N) 1)) )

# proper divisors
(de propDiv (N)  
   (make
      (for X (/ N 2)
         (when (=0 (% N X))
            (link X) ) ) ) )

# sum of proper divisors
(de sumPropDiv (N)
   (sum + (propDiv N)) )

(de abundant? (N)
   (> (sumPropDiv N) N) )

(de perfect-number? (N)
   (= N (sumPropDiv N)) )

(de amicable? (N)
   (let S (sumPropDiv N)
      (and 
         (not (= N S))
         (= N (sumPropDiv S)) ) ) )

(de make-amicable-chain (N)
   (let C N
      (make
         (link C)
         (loop
            (link (setq C (sumPropDiv C)))
            (T (= C N))                   # - it's a chain if we reach N again
            (T (> C 1000000) (made NIL))  # - no numbers higher than 1,000,000
            (T (= C 0) (made NIL))        # - bottoms out
            (T                            # - guard against getting stuck in an amicable chain that 
               (member C                  #   doesn't include the starting number
                  (cdr (head -1 (made))) )
               (made NIL) ) ) ) ) )

# pandigital
(de pan? (N)
   (= 
      (sort (mapcar any (chop N)) <)
      (range 1 (length N)) ) )

# prime predicate
(de prime? (N)
   (or
      (= N 2)
      (and
         (> N 1)
         (bit? 1 N)
         (let S (sqrt N)
            (for (D 3  T  (+ D 2))
               (T (> D S) T)
               (T (=0 (% N D)) NIL) ) ) ) ) )

(de circular-prime? (N)
   (when (prime? N)
      (let (C (chop N) L (length C))
         (fully '((E) (=T E))
            (make
               (for N (range 2 L)
                  (link (prime? (any (pack (rot C))))) ) ) ) ) ) )

(de truncatable-prime? (N)
   (let C (mapcar any (chop N))
      (and
         (> (length C) 1)
         (not (member 1 C))
         (fully odd? C)
         (fully '((X) (=T X))
            (make
               (for I (range (- (length C) 1) 1)
                  (link 
                     (prime? 
                        (any (pack (head I C))) ) ) ) ) )
         (fully '((X) (=T X))
            (make
               (for I (range (- (length C) 1) 1)
                  (link
                     (prime?
                        (any (pack (tail I C))) ) ) ) ) )
         ) ) )

# https://rosettacode.org/wiki/Nth_root#PicoLisp
(de nth-root (N A)
   (let (X1 A X2 (*/ A N))
      (until (= X1 X2)
         (setq
            X1 X2
            X2
            (*/
               (+
                  (* X1 (dec N))
                  (*/ A 1.0 (pow X1 (* (dec N) 1.0))) )
               N ) ) )
      X2 ) )

(de scaled-integer? (N)
   (fully '((N) (=0 N))
      (tail 6 (mapcar any (chop N))) ) )

(de perfect-cube? (N)
   (let 
      Fs
      (mapcar
         '((L) (mapcar any L))
         (by name group 
            (mapcar pack (prime-factors N)) ) )
      (fully 
         '((L) (=0 (% (length L) 3)))
         Fs ) ) )

(de potential-perfect-cube? (N)
   (let R (digital-root N)
      (or
         (= 1 R)
         (= 8 R)
         (= 9 R) ) ) )

# https://burningmath.blogspot.com/2013/09/how-to-know-or-check-if-number-is.html?m=1
(de digital-root (N)
   (let Ds (mapcar any (chop N))
      (until (=1 (length Ds))
         (setq Ds 
            (apply +
               (if (pair Ds)
                  Ds
                  (mapcar any (chop Ds)) ) ) ) )
      Ds ) )

(de permute-integer (N)
   (filter '((A) (= (length A) (length N)))
      (uniq 
         (mapcar '((X) (any (pack X)))
            (permute (chop N)) ) ) ) )

(de factorial (N)
   (if (=0 N)
      1
      (* N (factorial (dec N))) ) )

(de digit-factorial-sum (N)
   (apply +
      (mapcar '((X) (factorial (any (pack X))))
         (chop N) ) ) )

(de digit-factorial-chain (N)
   (let C N
      (make
         (link C)
         (loop
            (link (setq C (digit-factorial-sum C)))
            (T (member C (head -1 (made))) (made (head -1 (made)))) ) ) ) )  # - done if we hit any N again

(de nthcar (Lst N)
   (car (nth Lst N)) )

(de nthcars (Lst Ns)
   (make
      (for N Ns
         (link (nthcar Lst N)) ) ) )

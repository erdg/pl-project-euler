(load "utils.l" "@lib/simul.l")

(de p62 ()
   (catch 'Success
   (use Nums
      (let N 0
         (loop
            (prinl (inc 'N))
            # check if permutations of N are in idx
            (unless (idx 'Nums N)
            # if not add permutations of N to Nums idx
               (let Ps (permute-integer N)
                  (for I Ps
                     (idx 'Nums I T) )
                  (when
                     (= 2
                        (length 
                           (filter perfect-cube? 
                              (filter
                                 potential-perfect-cube? 
                                 Ps ) ) ) )
                     (throw 'Success N) ) ) ) ) ) ) ) )
            # and check if there are perfect cubes
            # else repeat on next N that is not in idx

(de p62%% ()
   (use Nums
      (let N 0
         (loop
            (prinl (inc 'N))
            (T
               (if (idx 'Nums N)
                  NIL
                  (let Ps (permute-integer N)
                     (or
                        (= 2
                           (length
                              (! filter perfect-cube? Ps) ) )
                        (nil (for I Ps (idx 'Nums I T))) ) ) ) N ) ) ) ) )

(de p62% ()
   (let N 41000000
      (loop
         (prinl N)
         (T
            (= 3
               (filter perfect-cube?
                  (filter
                     '((X)
                        (or
                           (= 1 (digital-root X))
                           (= 8 (digital-root X))
                           (= 9 (digital-root X))))
                     (mapcar
                        '((Y) (any (pack Y)))
                        (permute (chop (inc 'N)))))))
            N ) ) ) )

# this will give the right answer, but there might not
# be enough time left in the universe to compute it.
(de p62-3 ()
   (let (Nums '()  N 41063624)
      (loop
         (prinl N)
         (T
            (unless (idx 'Nums (inc 'N))
               (let Ps (permute-integer N)
                  (or
                     (= 3
                        (length (filter perfect-cube?
                           (filter potential-perfect-cube? Ps ) ) ) )
                     (nil (for I Ps (idx 'Nums I T))))))
            N ) ) ) )

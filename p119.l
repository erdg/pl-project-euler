(load "utils.l")

# brute force every integer 1 to N... too long
(de p119% ()
   (let N 0
      (make
         (loop
            (prinl N)
            (when (power-digit-sum? (inc 'N)) (link @))
            (T (= 10 (length (made)))) ) ) ) )

# reverse the idea - generate a bunch of powers and check for power
# digit sums
(de p119 ()
   (nthcar 
      (sort 
         (uniq
            (make
               (for A 100
                  (for B 100
                     (when (power-digit-sum? (** A B)) (link @)) ) ) ) ) )
      30 ) )
# -> 248155780267521

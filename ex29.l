# projecteuler.net/problem=29
(de ex29 ()
   (distinctPowers 2 100) )

(de distinctPowers (Lo Hi)
   (length
      (uniq
         (make
            (let R (range Lo Hi)
               (for A R
                  (for B R
                     (link (** A B)) ) ) ) ) ) ) ) 

(test 15 (distinctPowers 2 5))

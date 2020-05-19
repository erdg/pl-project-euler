# prime cube partnership
(load "utils.l")

# this will work, but will take a very long time
# like several days
(de p131 ()
   (make
      (for P (filter prime? (range 1 1000))
         (for N 1000
            (println (cons N P))
            (when (perfect-cube? (n3+n2p N P))
               (link P) ) ) ) ) )

(de n3+n2p (N P)
   (+ (** N 3) (* (** N 2) P)) )

(de p131% ()
   (fish num? 
      (prog1
         (mapcan
            '((P)
               (later (cons) 
                  (make
                     (for N 10000
                        (when (perfect-cube? (n3+n2p N P))
                           (link (cons P N)) ) )
                     (link T) ) ) )
            (filter prime? (range 1 1000)) )
         (wait NIL (full @))) ) )

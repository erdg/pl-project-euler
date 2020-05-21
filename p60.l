# prime pair sets
(load "utils.l")

(de p60-test ()
   (fully prime?
      (mapcar '((N) (any (pack N)))
         (map-subsets-to-list (3 7 109 673) (subsets 2 (1 2 3 4))) )  ) )

# this works...
(de p60-test% ()
   (let [Ps (filter prime? (range 3 1000 2))
         LastP (last Ps) ]
      (catch 'Done
         (for A Ps
            (for B (range A LastP 2)
               (for C (range B LastP 2)
                  (for D (range C LastP 2)
                     (prinl (glue "," (list A B C D)))
                     (when (prime-pair-set-test? (list A B C D))
                        (throw 'Done (+ A B C D)) ) ) ) ) ) ) ) )


(de p60-test2 ()
   (let [Ps (filter prime? (range 3 10000 2))
         LP (last Ps) ]
      (catch 'Done
         (for A Ps
            (for B (filter prime? (range A LP 2))
               (for C (filter prime? (range B LP 2))
                  (for D (filter prime? (range C LP 2))
                     (for E (filter prime? (range D LP 2))
                        (prinl (glue "," (list A B C D E)))
                        (when (prime-pair-set? (list A B C D E))
                           (throw 'Done (+ A B C D E)) ) ) ) ) ) ) ) ) )

# ...so this should work. but it will take a really long time
(de p60-test3 ()
   (let [Ps (filter prime? (range 3 10000 2))
         LP (last Ps) ]
      (catch 'Done
         (for A Ps
            (for B (nth Ps (+ (index A Ps) 1))
               (for C (nth Ps (+ (index B Ps) 1))
                  (for D (nth Ps (+ (index C Ps) 1))
                     (for E (nth Ps (+ (index D Ps) 1))
                        (prinl (glue "," (list A B C D E)))
                        (when (prime-pair-set? (list A B C D E))
                           (throw 'Done (+ A B C D E)) ) ) ) ) ) ) ) ) )

(de prime-pair-set? (Primes)
   (fully prime?
      (mapcar '((N) (any (pack N)))
         (map-subsets-to-list Primes (concatenative-pair-subsets)) ) ) )

(de concatenative-pair-subsets ()
   (make
      (mapcar
         '((L) (link L) (link (reverse L)))
         (subsets 2 (range 1 5)) ) ) )

(de prime-pair-set-test? (Primes)
   (fully prime?
      (mapcar '((N) (any (pack N)))
         (map-subsets-to-list Primes (concatenative-pair-subsets-test)) ) ) )

(de concatenative-pair-subsets-test ()
   (make
      (mapcar
         '((L) (link L) (link (reverse L)))
         (subsets 2 (range 1 4)) ) ) )

(de map-subsets-to-list (Lst Subs)
   (mapcar '((S) (nthcars Lst S)) Subs) )

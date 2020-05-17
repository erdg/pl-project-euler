(load "utils.l")

(de p30 ()
   (apply +
      (filter digit-fifth-power? (range 1 1000000)) ) )

(de digit-fifth-power? (N)
   (when (> (length (chop N)) 1)
      (= N
         (apply +
            (mapcar
               '((C) (** (any C) 5))
               (chop N) ) ) ) ) )

(de digit-fourth-power? (N)
   (when (> (length (chop N)) 1)
      (= N
         (apply +
            (mapcar
               '((C) (** (any C) 4))
               (chop N) ) ) ) ) )

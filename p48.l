(de p48 ()
   (any
      (pack
         (tail 10
            (chop
               (apply +
                  (mapcar 
                     '((N) (** N N))
                     (range 1 1000) ) ) ) ) ) ) )

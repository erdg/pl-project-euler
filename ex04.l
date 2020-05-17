(load "utils.l")

(de ex04 ()
   (last
      (by > sort
         (uniq
            (make
               (for X 999
                  (for Y 999
                     (when (pal? (* X Y))
                        (link @) ) ) ) ) ) ) ) )

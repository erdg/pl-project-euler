(de p20 ()
   (apply +
      (mapcar any
         (chop
            (apply * (range 100 1)) ) ) ) )

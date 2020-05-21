# champernowne's constant
(de p40 ()
   (let [R (mapcar any (chop (pack (range 1 200000))))
         D '((N) (car (nth R N))) ]
      (* (D 1)
         (D 10)
         (D 100)
         (D 1000)
         (D 10000)
         (D 100000)
         (D 1000000) ) ) )

(load "utils.l")

(de p23 ()
   (let Nums (filter abundant? (range 1 28123))
      (and 
         (make
            (for X Nums
               (for Y Nums
                  (T (> (+ X Y) 28123) T)
                  (unless (member (+ X Y) (made))
                     (link (+ X Y) ) ) ) )
         (diff (range 1 28123) @)
         (apply + @) ) ) ) )

(de p23% ()
   (let Nums (filter abundant? (range 12 28123 2))
      Nums ) )

#{
      (and
         (make
            (for X Nums
               (for Y Nums
                  (let N (+ X Y)
                     (T (> N 28123) T)
                     (unless (index N (made))
                        (link N) ) ) ) ) )
         (diff (range 1 28123) (uniq @))
         (sum + @) ) ) )
}#

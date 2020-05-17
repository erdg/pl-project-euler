(load "utils.l")

(de p05 ()
   (let M 1
      (for N (range 1 20)
         (setq M (lcm M N)) )
      M ) )

(load "utils.l")

(de p45 ()
   (let [Ts (mapcar triangle-number (range 1 100000))
         Ps (mapcar pentagonal-number (range 1 100000)) ]
         #Hs (mapcar hexagonal-number (range 1 100000)) ]
      (sect Ts Ps) ) )



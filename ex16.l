(load "@lib/math.l")

(de ex16 ()
   (and (** 2 1000)
      (chop @)
      (mapcar any @)
      (sum + @) ) )

(de ex16% ()
   (sum + (mapcar any (chop (** 2 1000)))) )

(de power-digit-sum (N X)
   (sum + (mapcar any (chop (** N X)))) )

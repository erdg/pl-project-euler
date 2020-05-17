(load "utils.l")

# takes 20 seconds or so
(de p35 ()
   (filter circular-prime?  (range 1 1000000)) )

(load "utils.l")

# takes about 1 minute on my phone
(de p14 ()
   (last
      (by cdr sort
         (mapcar
            '((N) (cons N (length-of-collatz N)))
            (range 1 999999) ) ) ) )

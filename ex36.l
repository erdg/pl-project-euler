# Double-base Palindromes

(load "utils.l")

(de ex36 ()
   (sum +
      (filter
         '((N) (and (pal? N) (pal? (any (bin N)))))
         (range 1 999999) ) ) )

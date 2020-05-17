(de p52 ()
   (let N 0
      (loop
         (T (permuted-multiple? (inc 'N)) N) ) ) )

(de permuted-multiple? (N)
   (and
      (same-digits? N (2x N))
      (same-digits? N (3x N))
      (same-digits? N (4x N))
      (same-digits? N (5x N))
      (same-digits? N (6x N)) ) )

(de same-digits? (X Y)
   (=
      (length X)
      (length Y)
      (length (sect (chop X) (chop Y))) ) )


(de 2x (N) (* N 2))
(de 3x (N) (* N 3))
(de 4x (N) (* N 4))
(de 5x (N) (* N 5))
(de 6x (N) (* N 6))

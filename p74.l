# digit factorial chains
(load "utils.l")

(de p74 ()
   (length
      (make
         (for N 999999
            (prinl N)
            (when (= (length (digit-factorial-chain N)) 60)
               (link T) ) ) ) ) )
# -> 402

# (de factorial (N)
#    (if (=0 N)
#       1
#       (* N (factorial (dec N))) ) )

# (de digit-factorial-sum (N)
#    (apply +
#       (mapcar '((X) (factorial (any (pack X))))
#          (chop N) ) ) )

# (de digit-factorial-chain (N)
#    (let C N
#       (make
#          (link C)
#          (loop
#             (link (setq C (digit-factorial-sum C)))
#             (T (member C (head -1 (made))) (made (head -1 (made)))) ) ) ) )  # - done if we hit any N again




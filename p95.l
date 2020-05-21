# amicable chains
(load "utils.l")

# initially tried (range 1 20000) - the longest chain was 29 and some of the
# numbers in the chain where nearing 1000000

# submitted the answer just to see... and by golly it was correct!

(de p95 ()
   (car
      (sort
         (maxi length
            (make
               (for N (range 14000 14500)  # (range 1 20000) takes a couple minutes
                  (prinl N)  # see where loop is at
                  (when (pair (make-amicable-chain N))  
                     (link @) ) ) ) ) ) ) )
# -> 14316

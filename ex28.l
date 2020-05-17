(de ex28 () (sumDiagonals 1001))
      


(de sumDiagonals (Len)  # length of square side 
      (sum +
         (make
            (link 1)
            (let Cnt 1  # see below  
               (for N (range 2 Len 2)
                  (do 4 (link (inc 'Cnt N))) ) ) ) ) )

# just a pattern I noticed...
#
# Start with 1, then follow the value to increment the Counter:
#
#6                 6
#   4           4         
#      2     2           
#         1              
#      2     2          
#   4           4        
#6                 6      
#                     ...  


                           


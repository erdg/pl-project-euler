(de ex13 ()
   (and
      (make
         (in "large-sum.txt"
            (until (eof)
               (link (line T)) ) ) )
      (mapcar any @)
      (sum + @)
      (any (pack (head 10 (chop @)))) ) )

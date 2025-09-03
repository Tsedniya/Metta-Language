The only thing i can't do is the sort

!!! To Append 

(: append (-> (List Number) Number (List Number)))
(= (append Nil $x) (Cons $x Nil))
(= (append (Cons $head $tail) $x) (Cons $head (append $tail $x)))
!(append (Cons 1 (Cons 2 (Cons 3 Nil))) 4)
 
 !!! To remove find by index


(: get-at-index (-> (List Number) Number Number))
(= (get-at-index (Cons $head $tail) 0) $head)
(= (get-at-index (Cons $head $tail) $index) (get-at-index $tail (- $index 1))) :- (> $index 0)
(= (get-at-index Nil $index) (Error "Index out of bounds"))

! (get-at-index (Cons 3 (Cons 1 (Cons 4 (Cons 1 (Cons 2 Nil))))) 2)

!!! To foldl


(: foldl (-> (-> Number Number Number) Number (List Number) Number))
(= (foldl $op $init Nil) $init)
(= (foldl $op $init (Cons $head $tail)) (foldl $op ($op $init $head) $tail))

(: add (-> Number Number Number))
(= (add $x $y) (+ $x $y))


! (foldl add 0 (Cons 3 (Cons 1 (Cons 4 (Cons 1 (Cons 2 Nil))))))
 
!!! To foldr


(: foldr (-> (-> Number Number Number) Number (List Number) Number))
(= (foldr $op $init Nil) $init)
(= (foldr $op $init (Cons $head $tail)) ($op $head (foldr $op $init $tail)))


(: add (-> Number Number Number))
(= (add $x $y) (+ $x $y))

! (foldr add 0 (Cons 3 (Cons 1 (Cons 4 (Cons 1 (Cons 2 Nil))))))



!!! MAP 

(: map (-> (-> Number Number) (List Number) (List Number)))
(= (map $f Nil) Nil)
(= (map $f (Cons $head $tail)) (Cons ($f $head) (map $f $tail)))

; Double
(: double (-> Number Number))
(= (double $x) (* $x 2))

; Square
(: square (-> Number Number))
(= (square $x) (* $x $x))


! (map double (Cons 3 (Cons 1 (Cons 4 (Cons 1 (Cons 2 Nil))))))
! (map square (Cons 3 (Cons 1 (Cons 4 (Cons 1 (Cons 2 Nil))))))

sort!!

(: insert (-> Number (List Number) (List Number)))
(= (insert $x Nil) (Cons $x Nil))
(= (insert $x (Cons $head $tail))
   (if (<= $x $head)
       (Cons $x (Cons $head $tail))
       (Cons $head (insert $x $tail))))

(: insertionSort (-> (List Number) (List Number)))
(= (insertionSort Nil) Nil)
(= (insertionSort (Cons $head $tail)) (insert $head (insertionSort $tail)))
! (insertionSort (Cons 3 (Cons 1 (Cons 4 (Cons 1 (Cons 2 Nil))))))

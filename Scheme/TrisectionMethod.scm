;Question 4: Write a Scheme program for computing a maximum of function f(x) within the
;interval [x1, x2]. Use the trisection method, and find the coordinate of maximum xmax with
;accuracy of 6 significant decimal digits.
;Find the maximum value for function in the interval
;find the coordinates for output of console

(define written (lambda (x n)
(display (/ (round (* x (expt 10 n))) (expt 10 n)))))
;defines themax to find largest in the interval
;can grab function, ex: (themax tan 1 -1)
(define themax ( lambda (function coordinate1 coordinate2)
;if the coordinates subtracted are the most minimal of error display result
(cond ((<(- coordinate2 coordinate1) 1e-10)
(display "The max of f(")
(written (/ (+ coordinate1 coordinate2) 2) 4)
(display ") is equal to ")
(written (function( / (+ coordinate1 coordinate2) 2)) 4))
;cut the function by thirds
(else (let (( find1(+ coordinate1 (/ (- coordinate2 coordinate1) 3)))
(find2 (- coordinate2 (/(- coordinate2 coordinate1) 3))))
;recurse with new coordinate points
(if (< (function find1) (function find2))
(themax function find1 coordinate2)
(themax function coordinate1 find2)))))))

;Output:
;> (themax tan -1 1)
;max of f(1) is equal to 1.5574
;> (themax sin -1 1)
;max of f(1) is equal to 0.8415
;> (themax cos -1 1)
;max of f(0) is equal to 1.0
;>

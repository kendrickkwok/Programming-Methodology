;Question 5: Develop a program that computes the scalar product of two vectors. The program
;must not accept vectors having different size (in such a case print an error message).
;(a)Iterate using a DO loop
;Holds the sum of the sizes
(define sum 0)
(define sizeof1 0)Kendrick Kwok – HW#6 SCHEME – 11//28/16
(define sizeof2 0)
;Develop program computes scalar product of two vectors
(define (scalar-product vector1 vector2)
;Set the length of the two vector sizes
(set! sizeof1 (vector-length vector1))
(set! sizeof2 (vector-length vector2))
;If size one does not match size two, then print out error message
(cond ((= sizeof1 sizeof2)
;loop iteratively
(do (( x 0 ( + x 1 )))
;if size is equal to iteratation, display sum number
((= x sizeof1)(display sum))
;multiply and add to sum count
(set! sum(+ sum (* (vector-ref vector1 x)
(vector-ref vector2 x))))))
(else( display "ERROR: Different sizes of vector!")))
(set! sum 0)
(set! sizeof1 0)
(set! sizeof2 0))

;Output:
;> (scalar-product '#(1 2 3) '#(2 1 1))
;7
;> (scalar-product '#(1 2 3) '#(1 2 3 4 5))
;ERROR: Different sizes of vector!

;(b) Write the program using recursion.
;Holds the sum of the sizes
(define sum 0)
(define x 0)
(define sizeof1 0)
(define sizeof2 0)
;Develop program computes scalar product of two vectors
(define (RECscalar-product vector1 vector2)
;Set the length of the two vector sizes
(set! sizeof1 (vector-length vector1))
(set! sizeof2 (vector-length vector2))
;If size one does not match size two, then print out error message
(cond ((= sizeof1 sizeof2)
;loop recursively
;if recursive matches size, display the sum
(cond ((= sizeof1 x)(display sum))
(else
;multiply and add to sum count
(set! sum(+ sum (* (vector-ref vector1 x)Kendrick Kwok – HW#6 SCHEME – 11//28/16
(vector-ref vector2 x))))
(set! x (+ x 1))
;recurse the call to iterate again
(RECscalar-product vector1 vector2))))
(else( display "ERROR: Different sizes of vector!")))
(set! sum 0)
(set! sizeof1 0)
(set! sizeof2 0)
(set! x 0))

;Output:
;> (RECscalar-product '#(1 2 3) '#(2 1 1))
;7
;> (RECscalar-product '#(1 2 3) '#(2 1 1))
;7
;> (RECscalar-product '#(1 2 3) '#(1 2 3 4 5))
;ERROR: Different sizes of vector!

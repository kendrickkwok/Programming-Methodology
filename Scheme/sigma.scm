;Question 2:
;Write a Scheme function sigma that computes the standard deviation of any number of
;arguments.
;mean value of n numbers is (x + x1)/n
;mean value of n^2 = (x^2 + x1^2)/n
;standard deviation is SQROOT(meanvalue - (meanvalueSQ))

(define (sq x) (* x x))
(define (addList x) (if (null? x) 0 (+ (car x)(addList (cdr x)))))
(define (addListSQ x) (if (null? x) 0 (+ (sq(car x))(addListSQ (cdr x)))))Kendrick Kwok – HW#6 SCHEME – 11//28/16
(define (mean x)(/ (addList x)(length x)))
(define (meanSquared x)(/ (addListSQ x) (length x)))
(define sigma(lambda x (sqrt(-(meanSquared x)(sq(mean x))))))

;Output:
;> (sigma 1 2 3 2 1)
;0.7483314773547883
;> (sigma 1 3 1 3 1 3)
;1
;> (sigma 1)
;0
;> (sigma 1 3)
;1
;>

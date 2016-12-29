;Question 3:
;(a) Write a recursive Scheme procedure line that prints n asterisks in a line as follows: 3⁄4
;(line 5) 1 *****
;Print asterisks to line given specified count

(define (line x)
(cond ((> x 0)
(write '*)
(line (- x 1)))))

;recursive call until no more asterisks to be printed
;Output:
;> (line 6)
;******
;>

;(b) ) Write a recursive Scheme procedure histogram that uses the procedure line, and prints a
;histogram for a list of integers
;histogram that uses procedure line to print list of integers
(define (histogram list)
(cond ((null? list) (display ""))
(else (line (car list))(newline)(histogram(cdr list)))))
;Output:
;> (histogram '(1 2 3 2 1))
;*
;**
;***
;*
;>

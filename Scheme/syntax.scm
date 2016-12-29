;Question 1:
;a)The first class object may be expressed as an anonymous literal value (constant). Show an
;example of the anonymous function and its use.
( (lambda (n) (* n n)) 10)
;Output:
;100
;>

;(b) The first class object may be stored in variables (i.e. it may have a symbolic name). Show
;examples of defining and using named functions.
(define (multiply x) (* x x ))
;Output:
; (multiply 10)
;100

;(c) The first class object may be stored in data structures. Show an example of a data
;structure(e.g. a list) that contains functions
(define (makeList n)
(cond
((= n 1)(list 1))
(else (cons n (makeList (- n 1))))))
;Output:
;> (makeList 10)
;'(10 9 8 7 6 5 4 3 2 1)
;> (makeList 1)
;'(1)
;>

;(d) The first class object may be comparable to other objects for equality. Show an example of
;comparing functions and lists for equality.
(define compare? (lambda (x y) (equal? x y)))
;Output:
;> (compare? 12 12)
;#t
;> (compare? 10 11)
;#f

;(e) The first class object may be passed as parameter to procedures/functions. Show an example
;of passing function as an argument to another function.
(define (multiplyBy20 x)(* x 20 ))
;Output:
;> (map multiplyBy20(list 1 2 3 4))
;'(20 40 60 80)
;>

;(f) The first class object may be returned as result from procedures/functions. Show an example
;of returning a function as a result of another function.
(define (squareMe n) (define (passedSquare n) (* n n))(passedSquare n))
;Output:
;> (squareMe 25)
;625
;>

;(g) The first class object may be readable and printable. Show examples of reading function(s)
(begin (define a (read)) (define b (read)))
(define inputFile (open-input-file "file.txt"))
(define (fread inputFile)
(let ((item (read inputFile)))
(cond ((eof-object? item) (display ""))
(else (display " ") (display item) (fread inputFile)))))
(fread inputFile)
(close-input-port inputFile)
;Output:
;Hello! This is a test.
;>

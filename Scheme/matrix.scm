;Question 6:
;(a) Output the rows and columns from a file
;Program row prints out the row of matrixes defined in .dat
;Program col prints out the col of matrixes defined in .dat
;Show vector used for
(define (showVector v)
(do ((x 0 (add1 x)))
;if the vector length is greater less than x after recursion
; display nothing
((>= x (vector-length v))(display ""))
;else display the element of vector
(display (vector-ref v x))(display " ")))
(define (read-matrix filename)
(let* ((myFile (open-input-file filename))
;creates first character, number of rows
;creates second character, number of columns
(numberOfRows (read myFile))
(numberOfCols (read myFile))
(createMatrix (make-vector numberOfRows)))
;createMatrix contains the number of Rows vector
(do (( x 0 (add1 x)))
((>= x numberOfRows)(close-input-port myFile) createMatrix)
;let row be defined as vectors containing number of columns of elements
(let ((row (make-vector numberOfCols)))Kendrick Kwok – HW#6 SCHEME – 11//28/16
(do (( y 0 (add1 y)))
;if number of columns exceeds, set matrix to row
;else set number from file read
((>= y numberOfCols)(vector-set! createMatrix x row))
(vector-set! row y(read myFile)))))))
;Inner workings of Rows
(define (ro filename x)
(define createMatrix(read-matrix filename))
(vector-ref createMatrix x))
;Inner workings of columns
(define (co filename y)
(define createMatrix(read-matrix filename))
(define numberOfRows(vector-length createMatrix))
(define column(make-vector numberOfRows))
(do ((x 0 (add1 x)))
((>= x numberOfRows) column)
(vector-set! column x(vector-ref (vector-ref createMatrix x) y))))
;Find the columns for output
(define (col filename y)
(showVector(co filename y)))
;Find the rows for output
(define (row filename x)
(showVector(ro filename x)))

;Output:
;> (col "matrix1.dat" 0)
;1 4
;> (col "matrix1.dat" 1)
;2 5
;> (row "matrix1.dat" 0)
;1 2 3
;> (row "matrix1.dat" 1)
;4 5 6
;>

;(b) Develop program for matrix multiplication that multiplies two matricies stored in input files.
;Takes two files and creates another file with the product
;Reuses functions from the 6(a)
;REUSING-----------------------------------------------------------------
;Show vector used for
(define (showVector v)
(do ((x 0 (add1 x)))
;if the vector length is greater less than x after recursion
; display nothingKendrick Kwok – HW#6 SCHEME – 11//28/16
((>= x (vector-length v))(display ""))
;else display the element of vector
(display (vector-ref v x))(display " ")))
(define (read-matrix filename)
(let* ((myFile (open-input-file filename))
;creates first character, number of rows
;creates second character, number of columns
(numberOfRows (read myFile))
(numberOfCols (read myFile))
(createMatrix (make-vector numberOfRows)))
;createMatrix contains the number of Rows vector
(do (( x 0 (add1 x)))
((>= x numberOfRows)(close-input-port myFile) createMatrix)
;let row be defined as vectors containing number of columns of elements
(let ((row (make-vector numberOfCols)))
(do (( y 0 (add1 y)))
;if number of columns exceeds, set matrix to row
;else set number from file read
((>= y numberOfCols)(vector-set! createMatrix x row))
(vector-set! row y(read myFile)))))))
;Inner workings of Rows
(define (ro filename x)
(define createMatrix(read-matrix filename))
(vector-ref createMatrix x))
;Inner workings of columns
(define (co filename y)
(define createMatrix(read-matrix filename))
(define numberOfRows(vector-length createMatrix))
(define column(make-vector numberOfRows))
(do ((x 0 (add1 x)))
((>= x numberOfRows) column)
(vector-set! column x(vector-ref (vector-ref createMatrix x) y))))
;Find the columns for output
(define (col filename y)
(showVector(co filename y)))
;Find the rows for output
(define (row filename x)
(showVector(ro filename x)))
;--------------------------------------------------------------------------------
;multiply performs the dot product
(define (multiply v1 v2)
(do ((x 0 (add1 x)) (result 0 (+ result ( *(vector-ref v1 x)(vector-ref v2 x)))))Kendrick Kwok – HW#6 SCHEME – 11//28/16
((>= x (vector-length v1)) result)))
(define (mmul filename1 filename2 filename3)
;Assign values to to read and output
(define matrix1 (read-matrix filename1))
(define matrix2 (read-matrix filename2))
(define numberOfRows (vector-length matrix1))
(define numberOfColumns (vector-length matrix2))
(define outFile (open-output-file filename3))
;Display the number of rows and number of columns to the outfile
(display numberOfRows outFile)(display " " outFile)
(display numberOfColumns outFile)(newline outFile)
(do ((x 0 (add1 x)))
;base case
((>= x numberOfRows) (close-output-port outFile)(display " "))
(let((row(make-vector numberOfColumns)))
(do ((y 0 (add1 y)))
((>= y numberOfColumns)(showVector row)(newline)(newline outFile))
;set element in the multiplier for dot product in row i and col j
(vector-set! row y(multiply (ro filename1 x)(co filename2 y)))
;display the elements of the rows used to the console
(display (vector-ref row y) outFile)(display " " outFile)))))

;Output:
;> (mmul "matrix1.dat" "matrix2.dat" "matrix3.dat")
;6 12 18
;15 30 45
;>

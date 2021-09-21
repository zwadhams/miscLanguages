;Lisp Homework CSCI 305 - Zach Wadhams

(defun palindromep( aList )
(setq frst (first aList))
(setq lst (first (last aList)))
(cond
	( (equal nil aList) (princ t) )
	( (= 1 (length aList)) (princ t) )
	( (equal frst lst)
		(setq a2 (cdr aList)) 
		(setq a3 (reverse (cdr (reverse a2 ))))  
		(palindromep a3) )
	( (= 0 0) (princ nil)))
(terpri)
(reading)
)

(defun reading()
(setq read (read))
(setq aList (first (last (first (last read)))))
(setq n (first read))
(setq m (string n))
(cond 
	((equal pal m) (palindromep aList))
	((= 0 0) (print "invalid function")))
)

(defun main()
(setq pal "PALINDROMEP")
(reading)
)

(main)
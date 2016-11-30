;; -*- mode: lisp-interaction -*-
;;; JKL-make-init-loader.el --- prototype procedurefor for init.el maker

;;;; TEST

(defun test-JKL-make-init-loader ()
  "Test `JKL-make-init-loader' with test data."
  (let (aa bb cc dd ee ff gg hh ii)
    (setq aa nil
          bb nil
          cc '(ee)
          dd '(aa)
          ee '(gg)
          ff '(aa)
          gg '(ff))
    (test-JKL-make-init-loader-sub "test1"
                                   '(aa bb cc dd ee ff gg)
                                   '(aa bb dd ff gg ee cc))

    (setq aa nil
          bb nil
          cc '(ee) ; err
          dd '(cc)
          ee '(gg)
          ff '(cc)
          gg '(ff))
    (test-JKL-make-init-loader-sub "test2"
                                   '(aa bb cc dd ee ff gg)
                                   'error)

    (setq aa nil
          bb nil
          cc '(ee)
          dd '(aa)
          ee '(gg) ; err
          ff '(aa)
          gg '(ee))
    (test-JKL-make-init-loader-sub "test3"
                                   '(aa bb cc dd ee ff gg)
                                   'error)

    (setq aa nil
          bb nil
          cc '(dd ff gg)
          dd '(aa)
          ee '(cc)
          ff '(bb)
          gg '(ff))
    (test-JKL-make-init-loader-sub "test4"
                                   '(aa bb cc dd ee ff gg)
                                   '(aa bb dd ff gg cc ee))
    nil))

(defun test-JKL-make-init-loader-sub (test-name input expected-result)
  "Evaluate `JKL-make-init-loader', check result and print it."
  (princ (format "\nstart `%s'...\n" test-name))
  (let ((result
         (condition-case err
             (JKL-make-init-loader (copy-sequence input))
           (error
            (princ (format "\t%s\n" err))
            'error))))
    (if (equal expected-result result)
        (progn
          (princ (format "PASS: `%s'.\n" test-name))
          t)
      (princ
       (format "FAIL: `%s' with input of `%s' and result of `%s'\
 (expected result is %s).\n"
               test-name input result expected-result)))))


;;;; FUNCTIONS

(defun JKL-make-init-loader (dir)
  (let ((items (JKL-get-elisps dir)) result-stack)
    (JKL-check-illegal-dependancy items)
    (multiple-value-setq (items result-stack)
      (JKL-add-independents-to-list items))
    (multiple-value-setq (items result-stack)
      (JKL-resolve-deps items result-stack))
    (nreverse result-stack)))

(defun JKL-get-elisps (dir)
  (remove-duplicates dir))

(defun JKL-check-illegal-dependancy (items)
  (dolist (item items t)
    (JKL-check-illegal-dependancy-rec item items nil)))

(defun JKL-check-illegal-dependancy-rec (item all-items appeared)
  (if (member item appeared)
      (error "circular definition is detected. %s" (cons item appeared)))
  (let ((dep-lst (eval item)))
    (if (null dep-lst)
        t
      (dolist (dep dep-lst t)
        (JKL-check-illegal-dependancy-rec dep
                                          all-items
                                          (cons item appeared))))))

(defun JKL-add-independents-to-list (items)
  (let (remain-stack result-stack)
    (while items
      (if (null (eval (car items)))
          (add-to-list 'result-stack (car items))
        (add-to-list 'remain-stack (car items)))
      (setq items (cdr items)))
    (values (nreverse remain-stack) result-stack)))

(defun JKL-resolve-deps (remains result-stack)
  (let (passed-stack)
    (while remains
      (while remains
        (if (subsetp (JKL-get-dependancy-list (car remains)) result-stack)
            (progn
              (add-to-list 'result-stack (car remains)))
          (add-to-list 'passed-stack (car remains)))
        (setq remains (cdr remains)))
      (setq remains (nreverse passed-stack))
      (setq passed-stack nil))
    (values remains result-stack)))

(defun JKL-get-dependancy-list (v)
  (eval v))


;;;; RUN TEST HERE

(test-JKL-make-init-loader)


;;;;----------------------------------------------------
(let ((a nil) (b '(c)) (c nil) (d '(b c)))
  (let ((input '(a b c d)))
    (nreverse (cadr
               (multiple-value-call #'JKL-resolve-deps
                                    (JKL-add-independents-to-list input))))))

(let ((a nil) (b '(a c d)) (c '(a d)) (d '(b)))
  (let ((input '(a b c d)))
    (JKL-check-illegal-dependancy input)))

;;;;----------------------------------------------------
(let* ((a 1) b c (lst '(a b c)))
  (dolist (v lst t)
    (print v)))
(subsetp '(b c) '(a c))
(member "ABC" '("ABC" 123 555 "test"))

(cdr '(1))

(null (print '(a b c)))

(remove-duplicates '(?a ?b ?c ?d))

(let ((l '(1 2 3)))
  (append l (list 4)))

(let ((l '(1 2 3 4)) l2)
  (setq l2 l)
  (setq l2 (append (cdr l2) (list 5)))
  (print l2)
  l)

'("foo" (?a ?b ?c))

(let ((lst '("a" "b" "c")))
  (delete (car lst) lst))

(let ((lst '(1 2 3)))
  (while lst
    (print (car lst))
    (setq lst (cdr lst))))

(princ "foobar")
(null (princ (format "\t%s\n" "r u kidding me?")))

;;;; END OF FILE

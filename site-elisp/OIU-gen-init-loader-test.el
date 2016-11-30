;;; -*- mode: emacs-lisp; coding: utf-8-unix; -*-
;;; OIU-gen-init-loader-test.el --- test script for `OIU-gen-init-loader.el'
;;; Commentary:
;;; Code:

;;; TEST CASES

(defun OIU-test-gen-init-loader ()
  ""
  (interactive)
  (princ (format-time-string "\nStart test at `%Y-%m-%d %H:%M:%S%z'...\n"))
  (let ((_result t)
		(_test-set '(
					 ("success-1" t
					  "~/testing/gen_init_loader/succ1/_init-loader.el"
					  ("~/testing/gen_init_loader/succ1")
					  "^[^_].*\\.el\\'")
					 ("stop-1" nil
					  "~/testing/gen_init_loader/stop1/_init-loader.el"
					  ("~/testing/gen_init_loader/stop1")
					  "^[^_].*\\.el\\'"))))
	;;
	(if (dolist (_test-case _test-set _result)
		  (setq _result (and _result (OIU-test-gen-init-loader-run _test-case))))
		(princ "\nAll tests are done with expected result...PASS\n")
	  (princ "\nAll tests are finish. Result is...FAIL\n"))
	_result))


;;;; TEST FUNCTIONS

(defun OIU-test-gen-init-loader-run (test-case)
  "Set `test-case' data to variables and run the check function."
  (princ (format "\nRun case `%s'...\n" (first test-case)))
  (setq OIU-init-loader-filename (nth 2 test-case))
  (setq OIU-init-file-directories (nth 3 test-case))
  (setq OIU-init-filename-regexp (nth 4 test-case))
  ;; run the function
  (condition-case _e
	  (OIU-generate-init-loader)
	(error
	 (princ (format "\t%s\n" _e))))
  (OIU-test-gen-init-loader-check-result (nth 1 test-case)))

(defun OIU-test-gen-init-loader-check-result (expected_result)
  "Evaluate `OIU-generate-init-loader', then check result and print it."
  ;; check result
  (if (file-exists-p OIU-init-loader-filename)
	  (progn
		(if (null expected_result)
			(progn (princ "FAIL: cannot detect illegal dependancy\n") nil)
		  (progn
			(condition-case _e
				(progn
				  (load OIU-init-loader-filename)
				  (progn (princ "PASS: good `init-loader' is generated\n") t))
			  (error
			   (princ (format "%s\nFAIL: generated illegal `init-loader'\n" _e))
			   nil)))))
	(if expected_result
		(progn (princ "FAIL: not generated `init-loader'\n") nil)
	  (progn (princ "PASS: illegal dependancy is detected correctly\n") t))))


;;;; run tests here
(OIU-test-gen-init-loader)

;;; OIU-gen-init-loader-test.el ends here

;;; LKJ-exec-directory-script.el --- Execute current directory script

;; Copyright (c) 2016 satocis
;;
;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.;; This program is free software; you can redistribute it
;; and/or modify

;;; Author: satocis <satocis@users.noreply.github.com>

;;; Commentary:

;; Execute current directory's script.
;; If registory the script name to `auto-exec-directory-script-list',
;; `exec-directory-script' don't ask you to execute it.

;;; Code:

(defvar LKJ-auto-exec-directory-script-list nil
  "Automatically executed script by `exec-directory-script'.")

(defvar LKJ-default-directory-script-name "dothis.command"
  "Executed script name by `exec-directory-script'.")

(defun LKJ-exec-directory-script (&optional script-name)
  "Return function that execute current directory script.

`SCRIPT-NAME' is executed script file name.  Not include directory."
  (unless script-name (setq script-name LKJ-default-directory-script-name))
  (let ((script-path (expand-file-name script-name
									   (file-name-directory (buffer-file-name)))))
	(if (and (file-exists-p script-path)
			 (eq 1 (logand (lsh (file-modes script-path) -6) #o1))
			 (or (member script-path LKJ-auto-exec-directory-script-list)
				 (let ((do-this-time? (y-or-n-p (format "Exec './%s' ? " script-name))))
				   (if do-this-time?
					   (and (y-or-n-p "Allow to exec this script automatically ? ")
							(add-to-list 'LKJ-auto-exec-directory-script-list script-path))
					 (message "Ok. Do nothing"))
				   do-this-time?)))
		(let ((std-out (shell-command-to-string (concat "./" script-name))))
		  (with-current-buffer "*Messages*"
			(goto-char (point-max))
			(insert std-out)
			(unless (eq (char-before) ?\n)
			  (insert "\n")))
		  (message "'./%s' Done. (See *Messages* buffer to check output)" script-name)))))

(provide 'LKJ-exec-directory-script)

;;; LKJ-exec-directory-script.el ends here

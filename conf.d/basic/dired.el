;; -*- mode: emacs-lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/dired.el

;;;@#@ ("basic")

(add-hook 'dired-load-hook
		  #'(lambda ()
			  (load "dired-x") ; use dired-x
			  (define-key dired-mode-map (kbd "V")
				'dired-view-file-other-window)))

;;(add-hook 'view-mode-hook
;;          #'(lambda ()
;;              (define-key view-mode-map (kbd "n")
;;                'dired-view-file-next)
;;              (define-key view-mode-map (kbd "p")
;;                'dired-view-file-previous)))

(defun dired-view-file-other-window ()
  "Peek files in dired buffer"
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (file-directory-p file)
		(or (and (cdr dired-subdir-alist)
				 (dired-goto-subdir file))
			(dired file))
      (view-file-other-window file))))

(defun dired-view-file-next (&optional arg)
  "Peek next (or previous) file in former dired buffer."
  (interactive)
  (if (eq
	   'dired-mode
	   (buffer-local-value 'major-mode (other-buffer (current-buffer) 1)))
	  (progn (View-quit)
			 (next-line arg)
			 (dired-view-file-other-window))
	(next-line arg)))

(defun dired-view-file-previous ()
  "Peek previous file in former dired buffer."
  (interactive)
  (dired-view-file-next -1))

;;; End of dired.el

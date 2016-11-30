;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/my-functions.el
;;
;;;@#@ ("basic")

;;;-------------------------------------------------------------------
;;; personal customizing functions
;;;-------------------------------------------------------------------

;;; eshell settings
(defun pcomplete/sudo ()
  "Completion rules for the `sudo' command."
  (let ((pcomplete-help "complete after sudo"))
    (pcomplete-here (pcomplete-here (eshell-complete-commands-list)))))


;;; yank-pop-forwards
(defun LKJ-yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))
(global-set-key [(M Y)] 'LKJ-yank-pop-forwards) ; M-S-y


;;; kill-buffer-and-frame
(defun LKJ-kill-buffer-and-frame ()
  (interactive)
  (let ((frame-to-delete (selected-frame))
		(buffer-to-kill (current-buffer)))
	(when (y-or-n-p (format "would you like to kill buffer (%s) and this frame? " buffer-to-kill))
	  (kill-buffer buffer-to-kill)
	  (delete-frame))))
(global-set-key (kbd "C-x 5 k") 'LKJ-kill-buffer-and-frame)

;;; toggle-case-replace
(defun LKJ-toggle-case-replace ()
  "Toggle `case-replace'."
  (interactive "*")
  (setq case-replace (not case-replace))
  (message (format "Now, `case-replace' is %s" case-replace)))

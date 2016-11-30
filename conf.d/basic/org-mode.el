;; USER-EMACS-DIR/conf.d/basic/org-mode.el --- org mode config
;;
;;; Commentary:
;;; Code:
;;
;;;@#@ ("basic")

(setq org-startup-truncated nil)
(add-hook 'org-mode-hook
		  (lambda ()
			(local-unset-key [(control tab)])
			(setq indent-tabs-mode nil)
			(setq org-html-doctype "html5")))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;;; org-mode.el ends here

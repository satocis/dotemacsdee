;; USER-EMACS-DIR/conf.d/basic/cc-mode.el --- cc-mode settings
;;
;;; Commentary:
;;; Code:
;;
;;;@#@ ("basic")

;; set indent-tabs-mode to nil
(add-hook 'c-mode-common-hook
		  #'(lambda ()
			  (setq indent-tabs-mode nil)))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;;; cc-mode.el ends here

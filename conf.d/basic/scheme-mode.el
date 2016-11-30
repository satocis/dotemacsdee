;;; scheme-mode.el --- scheme-mode setting
;;
;;;@#@ ("basic")

;;; Commentary:
;;; Code:

(defvar scheme-program-name)
(defvar linux-p)

(setq scheme-program-name (cond (linux-p "gosh -i")
								(t "csi -:c")))

(add-to-list 'process-coding-system-alist
			 '("gosh" utf-8 . utf-8))
(autoload 'scheme-mode "cmuscheme" "Major mode for scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior scheme process." t)

(add-hook 'scheme-mode-hook
		  #'(lambda () (setq indent-tabs-mode nil)))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; scheme-mode.el ends here

;; USER-EMACS-DIR/conf.d/mod/uniquify.el
;;
;;;@#@ ("basic")

;;; uniquify --- display path to mode-line when same filename detected
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-strip-common-suffix t))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

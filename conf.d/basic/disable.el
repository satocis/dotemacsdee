;; USER-EMACS-DIR/conf.d/basic/disable.el
;;
;;;@#@ ("basic")

;; help-enable-auto-load to nil
(when (>= emacs-version-numeric 24.3)
 (setq help-enable-auto-load nil))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

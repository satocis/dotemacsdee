;; USER-EMACS-DIR/conf.d/ext/haxe-mode.el
;;
;;;@#@ ("elpa")

(when (require 'haxe-mode nil t)			; but already may be required by elpa automatically
  (add-to-list 'auto-mode-alist '("\\.hx\\'" . haxe-mode) nil #'equal))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

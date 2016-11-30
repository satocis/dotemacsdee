;; USER-EMACS-DIR/conf.d/ext/mozc.el --- mozc setting
;;
;;;@#@ ("elpa" "encode")

(when (require 'mozc nil t)
  (setq default-input-method "japanese-mozc"))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

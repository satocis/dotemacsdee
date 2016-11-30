;; USER-EMACS-DIR/conf.d/ext/evil.el --- evil mode setting
;;;@#@ ("elpa")

(setq evil-cross-lines t
      evil-move-cursor-back nil)
(when (require 'evil nil t)
  (evil-mode -1))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

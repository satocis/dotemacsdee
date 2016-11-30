;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/py-mode.el
;;
;;;@#@ ("basic")

;; Python-command is "py" (with Python 3 on Windows)
(when windows-p
  (setq python-python-command "py")
  (setq python-command "py"))

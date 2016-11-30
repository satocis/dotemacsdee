;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/ext/auto-complete.el
;;
;;;@#@ ("elpa")

;;(defvar ac-dictionary-directories nil)
(when (require 'auto-complete-config nil t)
  (ac-config-default)
  (setq ac-auto-start 2)
  (ac-set-trigger-key "TAB")
  (nconc ac-modes '(org-mode
                    lisp-mode
                    slime-repl-mode
                    clojure-mode
                    rust-mode
                    d-mode
                    csharp-mode
                    haxe-mode))
  (setq global-auto-complete-mode t))

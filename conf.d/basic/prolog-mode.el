;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/prolog-mode.el
;;
;;;@#@ ("basic")

;; .swi bind to prolog-mode
(setq prolog-system 'swi)
(when windows-p (setq prolog-program-name "c:/swipl/bin/swipl.exe"))
(add-to-list 'auto-mode-alist '("\\.swi\\'" . prolog-mode) nil #'equal)

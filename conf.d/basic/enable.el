;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/enable.el
;;
;;;@#@ ("basic")

;;;-------------------------------------------------------------------
;;; enable
;;;-------------------------------------------------------------------

;;
(put 'narrow-to-region 'disabled nil)

;;
(put 'scroll-left 'disabled nil)

;; use ?\a key on dired.
;; i don't need so many buffers.
(put 'dired-find-alternate-file 'disabled nil)

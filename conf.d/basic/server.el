;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/server.el
;;
;;;@#@ ("basic")

;;;; Server start
;; if exists, restart
(server-start)

;; don't ask when quit client
(remove-hook
 'kill-buffer-query-functions
 'server-kill-buffer-query-function)

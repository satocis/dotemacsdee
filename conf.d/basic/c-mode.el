;; USER-EMACS-DIR/conf.d/basic/c-mode.el --- c-mode settings
;;
;;; Commentary:
;;; Code:
;;
;;;@#@ ("basic")

;; set indent-tabs-mode to nil
(add-hook 'c-mode-hook
          #'(lambda ()
              (c-set-style "bsd")
              (setq c-basic-offset 4)))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;;; c-mode.el ends here

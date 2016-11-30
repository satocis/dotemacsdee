;; USER-EMACS-DIR/conf.d/ext/d-mode.el --- d-mode settings

;;;@#@ ("elpa")

(when (require 'd-mode nil t) ; but already may be required by elpa automatically
  (defvar c-basic-offset)
  (add-hook 'd-mode-hook
            #'(lambda ()
                (c-set-style "bsd")
                (setq c-basic-offset 4))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; d-mode.el ends here

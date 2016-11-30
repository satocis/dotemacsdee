;;; flycheck.el --- config for flycheck

;;;@#@ ("elpa")

(when (require 'flycheck nil t)
  (defvar flycheck-gcc-language-standard nil)
  (setq flycheck-gcc-language-standard "c90")
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (add-hook 'd-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c C-p") 'flycheck-previous-error)
              (local-set-key (kbd "C-c C-n") 'flycheck-next-error))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; flycheck.el ends here

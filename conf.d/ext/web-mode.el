;; USER-EMACS-DIR/conf.d/ext/web-mode.el --- web-mode settings

;;;@#@ ("elpa")

(when (require 'web-mode nil t) ; but already may be required by elpa automatically
  (defvar web-mode-engines-alist nil)
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'web-mode-engines-alist '("php" . "\\.php\\'"))
  (add-to-list 'auto-mode-alist '("\\.r[x]?html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'web-mode-engines-alist '("erb" . "\\.\\(erb\\|r[x]?html\\)\\'"))
  (defvar web-mode-markup-indent-offset)
  (defvar web-mode-css-indent-offset)
  (defvar web-mode-code-indent-offset)
  (defun my-web-mode-hook () ""
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq tab-width 2)
    (setq indent-tabs-mode nil))
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  )

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; web-mode.el ends here

;; USER-EMACS-DIR/conf.d/mod/nasm-mode.el -- nasm-mode config
;;
;;; Commentary:
;;
;;;@#@ ("basic")
;;; Code:

;;; nasm-mode-setting
(when (require 'nasm-mode nil t)
  (defvar nasm-mode-map nil)
  (add-to-list 'auto-mode-alist '("\\.\\(asm\\|inc\\)\\'" . nasm-mode))
  (defun LKJ-nasm-mode-config ()
    (setq-local tab-stop-list '(8 16 24 32 40 48 56 64 72 80 88 96 104 112 120))
    (setq tab-width 8)
    (define-key nasm-mode-map [?\r] nil))

  (add-hook 'nasm-mode-hook
            #'LKJ-nasm-mode-config))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; nasm-mode.el ends here

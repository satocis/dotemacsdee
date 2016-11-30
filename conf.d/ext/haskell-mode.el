;; USER-EMACS-DIR/conf.d/ext/haskell-mode.el --- haskell-mode setting
;;; Commentary:
;;; Code:

;;;@#@ ("elpa")

(when (autoloadp (ignore-errors (symbol-function 'haskell-mode)))
  (add-hook 'haskell-mode-hook
			#'(lambda ()
				(turn-on-haskell-indent)
				(progn
				  (define-key haskell-mode-map (kbd "C-x C-d") nil)
				  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
				  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
				  (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
				  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
				  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
				  (define-key haskell-mode-map (kbd "C-c M-.") nil)
				  (define-key haskell-mode-map (kbd "C-c C-d") nil)))))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;;; haskell-mode.el ends here

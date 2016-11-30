;; USER-EMACS-DIR/conf.d/ext/csharp-mode.el --- csharp-mode setting
;;; Commentary:
;;; Code:

;;;@#@ ("elpa")

;;; csharp-mode (already required by elpa automatically)
;; to work word manipulation functions (e.g. `capitalize-word')
(when (autoloadp (ignore-errors (symbol-function 'csharp-mode)))
  (add-hook 'csharp-mode-hook
			#'(lambda ()
				(modify-syntax-entry ?_ "_" csharp-mode-syntax-table)
				(setq c-basic-offset 4))))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;;; csharp-mode.el ends here

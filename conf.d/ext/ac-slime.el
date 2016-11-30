;; USER-EMACS-DIR/conf.d/ext/ac-slime.el --- auto-complete-slime sttings
;;
;; Commentary:
;; Code:

;;;@#@ ("elpa" "auto-complete")

(when (require 'ac-slime nil t)
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;; ac-slime.el ends here

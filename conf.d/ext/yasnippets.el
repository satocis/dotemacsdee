;; USER-EMACS-DIR/conf.d/ext/yasnippets.el
;;
;;;@#@ ("elpa")

(when (require 'yasnippet nil t)
  (yas-global-mode t)
  (add-hook 'snippet-mode-hook
            #'(lambda () (setq require-final-newline nil))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

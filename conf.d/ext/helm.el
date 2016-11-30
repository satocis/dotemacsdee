;; USER-EMACS-DIR/conf.d/ext/helm.el
;;
;;;@#@ ("elpa" "editor-basic")

(when (require 'helm-config nil t)
  (require 'helm-descbinds nil t)
  (require 'helm-migemo nil t)
;;;  (setq helm-use-migemo t)
;;;  (helm-mode 1)
  (global-set-key (kbd "C-c h") #'helm-mini)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

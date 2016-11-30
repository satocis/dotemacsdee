;; USER-EMACS-DIR/conf.d/ext/e2wm.el --- e2wm configs
;;
;;; Commentary:
;;; Code:
;;
;;;@#@ ("elpa")

(when (require 'e2wm nil t)
  ;; (load "e2wm-wfiler" t)
  ;; (e2wm:add-keymap
  ;;  e2wm:pst-minor-mode-keymap
  ;;  '(("prefix ;" . e2wm:dp-wfiler))
  ;; 	 e2wm:prefix-key)

  ;; (e2wm:add-keymap
  ;;  e2wm:dp-wfiler-minor-mode-map
  ;;  '(("C-t" . nil)) ;; disable 'e2wm:dp-wfiler-move-buffers-command
  ;;  e2wm:prefix-key)

  (global-set-key (kbd "C-c j ;") #'e2wm:start-management))

;; Local Variables:
;; mode: Emacs-Lisp
;; coding: utf-8-unix
;; End:

;;; e2wm.el ends here

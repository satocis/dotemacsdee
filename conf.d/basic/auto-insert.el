;; USER-EMACS-DIR/conf.d/basic/auto-insert.el
;;
;;;@#@ ("basic")

;;;; autoinsert

(require 'autoinsert nil t)
(setq auto-insert-directory
      (concat user-emacs-directory "templates/"))
(mapcar #'(lambda (_cons) (add-to-list 'auto-insert-alist _cons))
        '(((lisp-mode . "Lisp source code.") . "template.lisp")
          ;;((emacs-lisp-mode . "Emacs Lisp source code.") . "template.el")
          ((d-mode . "D source code.") . "template.d")))
(add-hook 'find-file-hook 'auto-insert)

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

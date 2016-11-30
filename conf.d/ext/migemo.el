;; USER-EMACS-DIR/conf.d/ext/migemo.el
;;
;;;@#@ ("elpa")

(when (require 'migemo nil t)
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))

  ;; Set your installed path
  (setq migemo-dictionary
        (cond (linux-p "/usr/share/cmigemo/utf-8/migemo-dict")
              (nt-p (expand-file-name "~/applications/cmigemo/dict/utf-8/migemo-dict"))
              (t nil)))
  (when nt-p (add-to-list 'exec-path "~/applications/cmigemo"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

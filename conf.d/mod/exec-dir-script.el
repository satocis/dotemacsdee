;;; USER-EMACS-DIR/conf.d/basic/exec-dir-script.el --- exec-dir-script settings
;;
;;;@#@ ("basic")

;;; Commentary:
;;; Code:

(when (require 'LKJ-exec-directory-script nil t)
  (add-hook 'after-save-hook
            #'(lambda ()
                (LKJ-exec-directory-script "dothis.command.after-save"))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; exec-dir-script.el ends here

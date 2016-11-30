;; USER-EMACS-DIR/conf.d/ext/elpa.el --- elpa setting
;;
;;; Commentary:
;;; Code:
;;
;;;@#@ ("basic")

(when (require 'package nil t)
  (defvar package-archives nil)
  (let ((additional-archive-list
         '(
           ;; melpa-stable -- auto packaged from upstream stable release
           ("melpa-stable" . "http://stable.melpa.org/packages/")
           ;; melpa -- automatically packaged from upstream source
           ;;("melpa" . "http://melpa.milkbox.net/packages/")
           ;; marmalade -- user uploaded packages manually
           ;;("marmalade" . "http://marmalade-repo.org/packages/")
           )))
        (mapc #'(lambda (item) (add-to-list 'package-archives item t))
              additional-archive-list))
  (setq package-pinned-packages nil)
  (package-initialize))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; elpa.el ends here

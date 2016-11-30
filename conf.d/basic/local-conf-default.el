;; USER-EMACS-DIR/conf.d/basic/local-conf-default.el --- default config values
;;
;;;@#@ ("basic")

;; set default custom value. but if values are already set, only redefine var-doc.
(defvar LKJ-emacs-local-config-alist
  '()
  "Local custom variables.
You can use this associated list to custom initialization. Main purpose of this variables is to absorb difference of platform, hardware etc.

The module, using this variable, must add \"local-conf-default\" to dependency line.")

(when (file-exists-p "~/emacs-local-config")
  (load (expand-file-name "~/emacs-local-config")))

;; Example 1: '~/emacs-local-config
;;(setq LKJ-emacs-local-config-alist
;;  '((frame-width . 91) (frame-height . 48)
;;    (frame-top . 10) (frame-left . 10)
;;    (font-height . 100)))

;; Example 2: How to get frame parameter
;; (frame-parameter (selected-frame) 'left) ; you can get '(width height left top) etc.

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; local-conf-default.el ends here

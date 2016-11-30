;; USER-EMACS-DIR/conf.d/basic/autosaving.el
;;
;;;@#@ ("basic")

;;; Disable Auto Save
(setq auto-save-default nil)     ; Disable auto-save
(setq delete-auto-save-files t)  ; Delete auto save file at quit emacs
(setq auto-save-visited-file-name nil)
(setq auto-save-interval 0)    ; Disable autosaving by character count
(setq auto-save-timeout 0)

(defvar LKJ-user-auto-save-directory
  (concat temporary-file-directory (user-login-name) "-emacs-autosave/"))

(unless (file-exists-p LKJ-user-auto-save-directory)
    (make-directory LKJ-user-auto-save-directory))

(add-to-list 'auto-save-file-name-transforms
             `(".*" ,LKJ-user-auto-save-directory t))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

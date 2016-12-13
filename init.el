;; USER-EMACS-DIR/init.el --- emacs initialization file
;;
;;; Initialize files and _init-loader.el
;;
;;; File structure
;;      (use to generate `_init-loader.el' by `OIU-gen-init-loader.el')
;;
;; USER-EMACS-DIR/  --- user-emacs-directory
;;  |   init.el --- include a script to gen. `_init-loader.el', then load them
;;  |   _init-loader.el --- loader init files. (DO NOT EDIT MANUALLY)
;;  |
;;  \---conf.d  --- other config files directory. (by variable)
;;          _foo-ignored.el --- ignore files from `OIU-gen-init-loader',
;;                              filename beginning from underscore (`_')
;;          foo.el          --- loaded with _init-loader
;;          bar.el
;;              :
;;              :
;;

;; Keep following comment line
;; To avoid automatically update this by packge.el
;;(package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;(defvar OIU-init-file-root-directory)
(defvar OIU-init-file-directories)
(defvar OIU-init-loader-filename
  (concat user-emacs-directory "_init-loader.el"))

(defun LKJ-run-gen-init-loader ()
  "Interactive wrapper for OIU-gen-init-loader."
  (interactive)
  (load-file (concat user-emacs-directory "site-elisp/OIU-gen-init-loader.el"))
  (setq OIU-init-file-directories '("basic" "ext" "mod"))
  (OIU-generate-init-loader)
  (when (file-exists-p OIU-init-loader-filename)
    (message "maybe `%s' is updated successfully" OIU-init-loader-filename)))

;; manual loading init file. (currently unused)
;;(load (concat user-emacs-directory "conf.d/basic/_basic.el"))

(when (file-exists-p OIU-init-loader-filename)
  (load OIU-init-loader-filename))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; init.el ends here

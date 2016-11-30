;; USER-EMACS-DIR/conf.d/basic/basic.el --- Basic settings
;;
;;;@#@ ()

(eval-when-compile (require 'cl))

;;;; Load path setting
(defconst LKJ-site-elisp-directory
  (concat user-emacs-directory "site-elisp/")
  "The directory for my elisp file.")

(dolist (dir (let ((dir LKJ-site-elisp-directory))
               (list dir (format "%s%d" dir emacs-major-version))))
  (when (and (stringp dir) (file-directory-p dir))
    (let ((default-directory dir))
      (add-to-list 'load-path default-directory)
      (normal-top-level-add-subdirs-to-load-path))))

;;;; Get platform information
(defun x->bool (elt) (not (not elt)))   ; use this at following functions

;; Emacs version check
(defvar emacs-version-numeric (string-to-number emacs-version)
  "Numeric Emacs version number for comparing purpose.")

;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

;;; basic.el ends here

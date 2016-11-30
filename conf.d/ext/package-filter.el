;; USER-EMACS-DIR/conf.d/ext/package-filter.el --- package-filter setting
;;; Commentary:
;;; Code:

;;;@#@ ("elpa")

(when (and (require 'package-filter nil t)
           (<= emacs-version-numeric 24.3))
  (defvar package-archive-enable-alist nil)
  (defvar package-archive-exclude-alist nil)
  (setq package-archive-enable-alist '(("gnu")
                                       ("marmalade")
                                       ("melpa")))
  (setq package-archive-exclude-alist '(("gnu"
                                         tc
                                         package-filter)
                                        ("marmalade"
                                         tc
                                         package-filter)
                                        ("melpa"
                                         flycheck
                                         flycheck-d-unittest
                                         d-mode))))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;;; package-filter.el ends here

;;; clojure-mode.el --- clojure-mode config

;; Keywords: local
;;; Commentary:
;;; Code:

;;;@#@ ("elpa")

(add-hook 'clojure-mode-hook
		  #'(lambda () (setq indent-tabs-mode nil)))

;; Local Variables:
;; mode: Emacs-lisp
;; coding: utf-8-unix
;; End:

;;; clojure-mode.el ends here

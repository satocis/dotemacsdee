;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/font.el
;;
;;;@#@ ("basic" "local-conf-default")

(defvar LKJ-emacs-local-config-alist)

(when window-system
  (let* ((fonts-by-priority
		  '("Ricty"
			"Ricty Diminished"
			"Inconsolata"
			"Monospace"
			"MS Gothic")))
	(while (and fonts-by-priority
				(not (find-font (font-spec :name (car fonts-by-priority)))))
	  (pop fonts-by-priority))
	(set-face-attribute
	 'default
	 nil
	 :family (or (cdr (assoc 'font-family LKJ-emacs-local-config-alist))
				 (car fonts-by-priority))
	 :height (or (cdr (assoc 'font-height LKJ-emacs-local-config-alist))
                 100))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; font.el ends here

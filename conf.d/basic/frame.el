;; USER-EMACS-DIR/conf.d/basic/frame.el --- frame setting
;;
;;;@#@ ("basic" "local-conf-default")

(defvar LKJ-emacs-local-config-alist)

(let ((width (or (cdr (assoc 'frame-width LKJ-emacs-local-config-alist))
			 78))
	  (height (or (cdr (assoc 'frame-height LKJ-emacs-local-config-alist))
			 24))
	  (top (or (cdr (assoc 'frame-top LKJ-emacs-local-config-alist))
			 nil))
	  (left (or (cdr (assoc 'frame-left LKJ-emacs-local-config-alist))
			 nil)))
  ;; set initial frame pos & size
  (setq initial-frame-alist
		(append
		 `(,(if top `(top . ,top))
		   ,(if left `(left . ,left))
		   (width . ,width)
		   (height . ,height)
		   ) initial-frame-alist))

  ;; set default frame pos & size
  (add-to-list 'window-system-default-frame-alist
			   (cons window-system
					 `((width . ,width) (height . ,height)))))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; frame.el ends here

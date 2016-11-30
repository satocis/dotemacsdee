;; USER-EMACS-DIR/conf.d/ext/session.el
;;
;;;@#@ ("elpa")

;;; history & session.el
(setq history-length t) ; t = infinit history length

(if (require 'session nil t)
    (progn
      (setq session-save-print-spec '(t nil nil))
      (setq session-initialize '(de-saveplace session keys menus places)
            session-globals-include '((kill-ring 50)
                                      (session-file-alist 500 t)
                                      (file-name-history 10000)))
      (add-hook 'after-init-hook 'session-initialize))
  (message "!!! session.el is not loaded now !!!"))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

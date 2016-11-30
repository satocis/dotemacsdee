;; USER-EMACS-DIR/conf.d/mod/slime.el
;;
;;;@#@ ("basic")

;;; SLIME
;;(add-to-list 'load-path "~/site-elisp/slime/") ; SLIME directory
(when (require 'slime nil t)
  (slime-setup '(slime-repl slime-fancy slime-banner))
  (setq inferior-lisp-program "sbcl")    ; Default Lisp system
  ;;(setq slime-net-coding-system 'utf-8-unix) ; communication encoding
  (setq slime-lisp-implementations    ; Selective lisp implementations
        `((sbcl ("sbcl" "--core"
                 ,(expand-file-name "~/.sbcl/sbcl-with-swank.core"))
                :init (lambda (port-file _)
                        (format "(swank:start-server %S)\n" port-file))
                :coding-system utf-8-unix)
          (ecl ("ecl") :coding-system utf-8-unix)))
  (setq
   ;; HyperSpeck body
   common-lisp-hyperspec-root (expand-file-name
                               "~/Documents/HyperSpec/"))
  (setq
   ;; symbol-table
   common-lisp-hyperspec-symbol-table (concat common-lisp-hyperspec-root
                                              "Data/Map_Sym.txt")))

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

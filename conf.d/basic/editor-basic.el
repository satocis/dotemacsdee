;;; USER-EMACS-DIR/conf.d/basic/editor-basic.el --- basic editor settings
;;
;;;@#@ ("basic")

;;; Commentary:
;;; Code:

;; Ignore case for completion
(setq completion-ignore-case t)
;; Set tab-stop-list
(setq tab-stop-list
      (if (>= emacs-version-numeric 24.4)
          nil
        '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64
            68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
;; Tab width set to 4
(setq-default tab-width 4)
;; Use tabs instead tabs
(setq-default indent-tabs-mode nil)
;; scroll one line a time
(setq scroll-conservatively 1)
;; Enable file local variable 'SECTION'
(setq local-enable-local-variables t)

;; Toggle order change for `recenter-top-bottom'
(setq recenter-positions '(top middle bottom))

;; enable subword-mode globally for 'camelCase'
(global-subword-mode)

;; Local Variables:
;; mode: emacs-lisp
;; coding: utf-8-unix
;; End:

;;; editor-basic.el ends here

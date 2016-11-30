;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/visual-setting.el
;;
;;;@#@ ("basic")

;; No menu bar (You can invoke menu by F10 or S-F10)
(menu-bar-mode -1)
;; No tool bar
(tool-bar-mode 0)
;; Ignore ring-bell
(setq ring-bell-function 'ignore)
;; Show paren
(show-paren-mode 1)
;; Show column number
(column-number-mode t)
;; No start-up message
(setq inhibit-startup-message t)
;; truncating long lines if windows widhth is less than 44
(setq truncate-partial-width-windows (+ 44 4))
;; indicate buffer begin & end
(setq indicate-buffer-boundaries 'left)

;;;; whitespace-mode
(global-whitespace-mode t)

;; set visible full width space
(setq whitespace-space-regexp "\\( +\\|\x3000+\\)")

;; change newline visible color
(set-face-foreground 'whitespace-newline "gold4")

;; delete half-width-space and newline-mark
(dolist (d '((space-mark ?\ ) (newline-mark ?\n)))
  (setq whitespace-display-mappings
		(delete-if
		 '(lambda (e) (and (eq (car d) (car e))
						   (eq (cadr d) (cadr e))))
		 whitespace-display-mappings)))
;; add full-width-space and new-newline-mark
(setq whitespace-display-mappings
	  '((space-mark ?\x3000 [?\□])
		(newline-mark ?\n [?\u2193 ?\n] [?$ ?\n])
		(tab-mark ?\t [?> ?\t] [?\\ ?\t])))

;; delete needless option
(dolist (d
;;;		 '(face lines space-before-tab indentation empty space-after-tab tab-mark))
		 '(lines newline-mark tab-mark)) ; `lines' means highlight long lines.
  (setq whitespace-style (delq d whitespace-style)))

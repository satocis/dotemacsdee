;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-
;; USER-EMACS-DIR/conf.d/basic/keybind.el
;;
;;;@#@ ("basic")

;;;-------------------------------------------------------------------
;;; basic command Key-bindings
;;;-------------------------------------------------------------------

;; C-h bind to delete-char (?\^? == DEL == 127)
(keyboard-translate ?\^h ?\^?)

;; C-Tab => undefined -> (other-window)
(global-set-key [(control tab)] #'other-window)
;; C-S-Tab => undefined -> (other-window -1) # this not work for winnt
(global-set-key [C-S-iso-lefttab] #'(lambda ()
                                      (interactive)
                                      (other-window -1)))
;; also C-x O => other-window -> (other-window -1) # for winnt
(global-set-key (kbd "C-x O") #'(lambda ()
                                  (interactive)
                                  (other-window -1)))

;;; "C-c LETTER" key-bindings (LETTER is [A-Za-z]) are reserved for user!!
;;  (see. Elisp manual D.2 Key Binding Conventions)
;;; "C-c ALPHABET" settings @@ do not use `C-c j' it's reserved for other uses.@@
;; ?v => view-file
(global-set-key (kbd "C-c v") #'view-file)

;; ?n => next-buffer
(global-set-key (kbd "C-c n") #'next-buffer)
;; ?p => previous-buffer
(global-set-key (kbd "C-c p") #'previous-buffer)

;; ?s => LKJ-go-to-*scratch*
(global-set-key (kbd "C-c s") #'(lambda ()
                                  (interactive)
                                  (switch-to-buffer "*scratch*")))

;;; "C-c j LETTER" settings (less frequently commands)
;; ?l => toggle-truncate-lines
(global-set-key (kbd "C-c j l") #'toggle-truncate-lines)

;;; C-c C-f bind to dired (Xyzzt compatible)
;;(define-key mode-specific-map [(C f)] 'dired)

;;; Since emacs 24.4, electric-indent-mode is enabled
(when (>= emacs-version-numeric 24.4)
  (global-set-key (kbd "C-j") 'newline)
  (global-set-key (kbd "C-m") 'electric-indent-just-newline))

;; Lisp interaction mode key binding
;;
;; <= v24.3, clear C-j (use global-map's newline-and-indent)
;; >= v24.4, use 'newline with electric-indent-mode
(define-key lisp-interaction-mode-map (kbd "C-j")
  (if (<= emacs-version-numeric 24.3)
      nil
    'newline))
;; bind eval-print-last-sexp to C-m
(define-key lisp-interaction-mode-map (kbd "<RET>") 'eval-print-last-sexp)

;; set S-<ARROWS> to window move
(setq windmove-wrap-around t)
(windmove-default-keybindings)

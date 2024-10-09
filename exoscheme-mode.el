;;; exoscheme-mode.el --- Summary: Provides a simple mode for Scheme syntax highlighting, derived from scheme-mode, but the code is based on [simpc-mode](https://github.com/rexim/simpc-mode) -*- lexical-binding: t -*-

;; Author: James Orson <jamesaorson@gmail.com>
;; URL: https://git.sr.ht/~jamesaorson/exoscheme-mode
;; Package-Version: 0

;;; Commentary:

;;; Usage:

;;; (require 'exoscheme-mode)
;;; ;; Automatically enable the exoscheme-mode major mode for *.scm files
;;;; (add-to-list 'auto-mode-alist '("\\.scm\\'" . exoscheme-mode))

;;; Code:

(require 'subr-x)

(defun exoscheme-types ()
  '("char" "int" "long" "short" "void" "bool" "float" "double" "size_t"))

(defun exoscheme-keywords ()
  '("define" "define*" "define-module" "use-modules" "use-module" "lambda" "lambda*"))

(defun exoscheme-builtins ()
  '("let" "let*" "cond" "if" "else" "when" "nil" "list" "+" "/" "-" "*"))

(defun exoscheme-specials ()
  '("," "'" "`" ",@"))

(defun exoscheme-constants ()
  "Lists out regex-opt constants."
  '("#t" "#f"))

(defun exoscheme-font-lock-faces ()
  "Regex pattern matching for faces."
  `((";.*" . font-lock-comment-face)
    (,(regexp-opt (exoscheme-keywords) 'symbols) . font-lock-keyword-face)
    (,(regexp-opt (exoscheme-builtins) 'symbols) . font-lock-builtin-face)
    (,(regexp-opt (exoscheme-types) 'symbols) . font-lock-type-face)
    (,(regexp-opt (exoscheme-constants)) . font-lock-constant-face)
    ("[0-9]+" . font-lock-constant-face)
    ("[0-9]*\.[0-9]+" . font-lock-constant-face)
    (,(regexp-opt (exoscheme-specials)) . font-lock-warning-face)
    ("<[a-zA-Z0-9*+-=%_/<>]+>" . font-lock-type-face)
    ("#:[a-zA-Z0-9*+-=%_/<>]+" . font-lock-variable-name-face)
    ("(\\([a-zA-Z0-9*+-=%_/<>]+\\)" . (1 font-lock-function-name-face))))

(define-derived-mode exoscheme-mode
                     scheme-mode
                     "Derived and enhanced version of scheme-mode"
                     "Simple major mode for editing Scheme files."
                     (setq-local font-lock-defaults '(exoscheme-font-lock-faces)))

(provide 'exoscheme-mode)

;;; exoscheme-mode.el ends here


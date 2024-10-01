;;; exoscheme-mode.el --- Summary: Provides a simple mode for Scheme syntax highlighting, derived from lisp-mode,
;;; but the code is based on [simpc-mode](https://github.com/rexim/simpc-mode) -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'subr-x)

(defun exoscheme-types ()
  '("char" "int" "long" "short" "void" "bool" "float" "double" "size_t"))

(defun exoscheme-builtins ()
  '("define" "define*" "define-module" "use-modules" "use-module" "lambda" "lambda*"))

(defun exoscheme-keywords ()
	'("let" "let*" "cond" "if" "else" "when" "nil"))

(defun exoscheme-specials ()
	'("," "'" "`" ",@"))

(defun exoscheme-constants ()
	'("#t" "#f"))

(defun exoscheme-font-lock-keywords ()
  `(
	(";.*" . font-lock-comment-face)
    (,(regexp-opt (exoscheme-keywords) 'symbols) . font-lock-keyword-face)
    (,(regexp-opt (exoscheme-builtins) 'symbols) . font-lock-builtin-face)
    (,(regexp-opt (exoscheme-types) 'symbols) . font-lock-type-face)
    (,(regexp-opt (exoscheme-constants)) . font-lock-constant-face)
    (,(regexp-opt (exoscheme-specials)) . font-lock-warning-face)
    ("<[a-zA-Z-_][a-zA-Z0-9-_]*>" . font-lock-type-face)
	("#:[a-zA-Z-_][a-zA-Z0-9-_]*" . font-lock-variable-name-face)
	("(\\([a-zA-Z-_][a-zA-Z0-9-_/]*\\)" . (1 font-lock-function-name-face))))

(define-derived-mode exoscheme-mode lisp-mode "Scheme mode derived from Lisp mode"
  "Simple major mode for editing C files."
  (setq-local font-lock-defaults '(exoscheme-font-lock-keywords)))

(provide 'exoscheme-mode)

;;; exoscheme-mode.el ends here


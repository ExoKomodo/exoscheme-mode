# exoscheme-mode

Provides a simple Scheme mode for Emacs, based on `lisp-mode`, with richer syntax highlighting than alternatives.

## Important Links

- [Public Distribution Repository](https://github.com/exokomodo/exoscheme-mode)
- [Development Repository](https://git.sr.ht/~jamesaorson/exoscheme-mode)
- [Existing `scheme-mode`](https://github.com/emacs-mirror/emacs/blob/master/lisp/progmodes/scheme.el)

## How to use

1. Install to your local package archive:

```shell
cd ~/.emacs.d/packages
curl -O https://raw.githubusercontent.com/exokomodo/exoscheme-mode/refs/heads/main/exoscheme-mode.el
```

2. Enable `exoscheme-mode` for scheme files

```emacs-lisp
(require 'exoscheme-mode)

;; Automatically enable the exoscheme-mode major mode for *.scm files
(add-to-list 'auto-mode-alist '("\\.scm\\'" . exoscheme-mode))
```


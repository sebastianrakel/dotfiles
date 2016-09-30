;;emacs lisp stuff

(require 'smartparens-config)

(defun my-elisp-hook()
  (rainbow-delimiters-mode)
  (smartparens-mode))

(add-hook 'emacs-lisp-mode-hook 'my-elisp-hook)

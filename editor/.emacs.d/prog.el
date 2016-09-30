(defun my-prog-hook()
  (rainbow-delimiters-mode)
  (smartparens-mode))

(add-hook 'prog-mode 'my-prog-hook)


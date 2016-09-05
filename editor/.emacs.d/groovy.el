(defun my-groovy-hook()
  (message "Groovy Mode")
  (linum-mode 1))

(add-hook 'groovy-mode-hook 'my-groovy-hook)

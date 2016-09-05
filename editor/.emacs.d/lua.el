(defun my-lua-hook()
  (message "Lua Mode")
  (linum-mode 1)
  )

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(add-hook 'lua-mode-hook 'my-lua-hook)


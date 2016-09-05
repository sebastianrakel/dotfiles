(defun my-gfm-hook()
  (message "Github Markdown Mode")

  (local-set-key (kbd "<f5>") 'markdown-live-preview-mode))


(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(add-hook 'gfm-mode-hook 'my-gfm-hook)

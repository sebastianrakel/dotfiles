;;; quick-jump.el --- jump to directory for keybinding use

;;; Code:
(defun quick-jump-open-directory(directory)
  (interactive)
  (projectile-find-file-in-directory directory))

(defun quick-jump-file(path)
  (interactive)
  (switch-to-buffer (find-file-noselect path)))

(provide 'quick-jump)

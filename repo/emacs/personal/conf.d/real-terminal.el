;;; real-terminal.el --- Open a real terminal like alacritty

;;; Code:
(defun real-terminal--open-path (path)
  (let ((command (concat "herbstclient spawn alacritty --working-directory " path)))
    (message (concat "Open Terminal with command: " command))
    (shell-command command)))

(defun real-terminal--open-with-current-directory()
  (message "Open Terminal with current directory path")
  (real-terminal--open-path(file-name-directory (buffer-file-name))))

(defun real-terminal--open-with-projectile()
  (message "Open Terminal with projectile path")
  (real-terminal--open-path(projectile-project-root)))

(defun real-terminal-open()
  (interactive)
  (if (projectile-project-root)
      (real-terminal--open-with-projectile)
    (real-terminal--open-with-current-directory)))

(provide 'real-terminal)

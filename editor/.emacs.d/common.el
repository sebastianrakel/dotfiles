;don't show the startup screen
(setq inhibit-startup-screen t)

; don't show the menu bar
(menu-bar-mode -1)

; don't show the tool bar
(tool-bar-mode -1)

; don't show the scroll bar
(scroll-bar-mode -1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq-default indent-tabs-mode nil)

(set-default 'truncate-lines t)

(global-set-key (kbd "<f1>") 'describe-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(set-default-font "foxxx0font")

(global-set-key (kbd "M-x") 'helm-M-x)

(defun my-set-title()
  (let ((open-file-buffer nil) (file-buffer-count 0))
      (dolist (value (buffer-list))
        (if (not (equal (buffer-file-name value) nil))
            (progn
              (setq open-file-buffer value)
              (setq file-buffer-count (+ file-buffer-count 1))))
        (if (equal file-buffer-count 1)
            (progn
              (let ((current-directory-name (file-name-nondirectory (directory-file-name (file-name-directory (buffer-file-name open-file-buffer))))))
                (set-frame-name current-directory-name)))))))

(add-hook 'find-file-hook 'my-set-title)

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

(setq c-default-style "linux"
      c-basic-offset 4)

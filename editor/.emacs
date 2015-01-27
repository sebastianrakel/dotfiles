(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-solarized-dark)

(require 'ecb)
(setq ecb-layout-name "leftright3")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 6)
(setq ecb-tip-of-the-day nil)
(setq ecb-source-path '("~/"))

(ecb-activate)

(smart-tabs-advice py-indent-line py-indent-offset)
(smart-tabs-advice py-newline-and-indent py-indent-offset)
(smart-tabs-advice py-indent-region py-indent-offset)

;don't show the startup screen
(setq inhibit-startup-screen t)

; don't show the menu bar
(menu-bar-mode -1)

; don't show the tool bar
(tool-bar-mode -1)

; don't show the scroll bar
(scroll-bar-mode -1)

(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)

(setq x-select-enable-primary t)
(setq x-select-enable-clipboard nil)

; python stuff
(require 'python-mode)
(defun my-python-hook()  
  (message "Python Mode")
  (linum-mode 1)
  (jedi:setup)
)
(add-hook 'python-mode-hook 'my-python-hook)

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(setq pdb-path '/usr/lib/python3.4/pdb.py
gud-pdb-command-name (symbol-name pdb-path))

(defadvice pdb (before gud-query-cmdline activate)
"Provide a better default command line when called interactively."
(interactive
(list (gud-query-cmdline pdb-path
(file-name-nondirectory buffer-file-name)))))

(global-set-key [f10] 'gud-next)
(global-set-key [f11] 'gud-step)
(global-set-key [f5] 'gud-cont)
(global-set-key [f12] 'gud-break)

; ruby stuff
(require 'ruby-mode)
(defun my-ruby-hook()
  (message "Ruby Mode")
  (linum-mode 1)
)

(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(add-hook 'ruby-mode-hook 'my-ruby-hook)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes
   (quote
	(("leftright3"
	  (ecb-directories-buffer-name 0.1746031746031746 . 0.9767441860465116)
	  (ecb-methods-buffer-name 0.12169312169312169 . 0.9767441860465116)))))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(set-default-font "foxxx0font")

(use-package base16-theme
  :ensure t)
(load-theme 'base16-default-dark t)

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "<f1>") 'describe-mode) 
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "<f4>") 'helm-buffers-list)
(global-set-key (kbd "<M-f1>") 'helm-dash)
(global-set-key (kbd "C-<f6>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "<f2>") 'helm-projectile)

(use-package auto-complete
  :ensure t)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(defun my-gfm-hook()
  (setq markdown-command "multimarkdown")
  (local-set-key (kbd "<f5>") 'markdown-live-preview-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (my-gfm-hook))

(use-package helm
  :ensure t)

(use-package powerline
  :ensure t)
;;(powerline-default-theme)

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t)

(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(defun my-prog-hook()
  (linum-mode 1)
  (rainbow-delimiters-mode)
  (smartparens-mode))

(add-hook 'prog-mode-hook 'my-prog-hook)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package go-mode
  :ensure t)

(use-package go-autocomplete
  :ensure t)

(use-package go-playground
  :ensure t)

(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v -gcflags '-N -l' && go test -v && go vet"))
  
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (require 'go-autocomplete)
  (message "Go Hook loaded"))
 
(add-hook 'go-mode-hook 'my-go-mode-hook)

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(use-package rainbow-delimiters
  :ensure t)
(use-package smartparens
  :ensure t)

(use-package nyan-mode
  :ensure t)

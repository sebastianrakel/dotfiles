;; Basic Package Setup
(require 'package)

;; Helper Methods

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))


;; Add package repos
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)


(require-package 'use-package)

;; Style Emacs

(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(set-fringe-mode 10)
(global-display-line-numbers-mode)
(set-default 'truncate-lines t)

(dolist (mode '(term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")

;; Font Settings

(add-to-list 'default-frame-alist '(font . "Hack-14"))

;; Load Packages
(use-package magit
  :defer 2
  :ensure t
  :pin melpa
  :bind
  (("C-x g" . magit-status)
   ("C-x M-d" . magit-dispatch-popup)))

(use-package dashboard
  :ensure t
  :config
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-set-navigator t)
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
  (dashboard-setup-startup-hook))

(use-package powerline
  :ensure t
  :config (powerline-default-theme))

(use-package company
  :ensure t
  :bind (
	 ("C-SPC" . company-complete))
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flymake
  :ensure t)

(use-package gruvbox-theme
  :ensure t
  :init
  (load-theme 'gruvbox-dark-hard t))

(use-package lsp-mode
  :ensure t
  :bind (
	 ("S-<f1>" . lsp-describe-thing-at-point)
	 ("S-<f6>" . lsp-rename)
	 ("<f12>" . lsp-find-definition)
	 ("S-<f12>" . lsp-find-references))
  :hook ((swift-mode . (lambda () (lsp)))
	 (python-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration)))


(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package helm
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("<f4>" . helm-buffers-list)
   ("C-<f4>" . helm-recentf))) 

(use-package helm-swoop
  :ensure t
  :bind
  (("C-s" . helm-swoop))
  :config
  (
   (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
   (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
   (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
   (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)))

(use-package helm-lsp
  :ensure t)

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t
  :bind
  (("<f2>" . helm-projectile-find-file))
  :init
  (helm-projectile-on)
  :config
  (define-key helm-find-files-map "\t" 'helm-execute-persistent-action))

(use-package rainbow-delimiters
  :ensure t)

(use-package smartparens
  :ensure t
  :config (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package yasnippet
  :ensure t)

;; Puppet
(use-package puppet-mode
  :ensure t)

;; Ansible
(use-package yaml-mode
  :ensure t)

(use-package ansible
  :ensure t)

;; Swift
(use-package swift-mode
  :ensure t)

(use-package lsp-sourcekit
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/usr/bin/sourcekit-lsp"))

;; C/C++

(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(use-package meson-mode
  :ensure t)

;; Flutter

(use-package dart-mode
  :ensure t)

(use-package flutter
  :ensure t)

(use-package lsp-dart
  :ensure t
  :hook (dart-mode . lsp))

;; Golang

(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
	 (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)))

;; Embedded

(use-package platformio-mode
  :ensure t)

;; Miscialous
(use-package toml-mode
  :ensure t)

(use-package web-mode
  :ensure t)

;; Hooks
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Keybindings

(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-c <f12>") 'reload-dotemacs)
(global-set-key (kbd "C-M-l") 'indent-buffer)

;; Custom Stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(web-mode meson-mode yasnippet ccls platformio-mode dashboard go-mode lsp-dart lsp-sourcekit swift-mode helm-lsp powerline helm-swoop yaml-mode helm-projectile projectile ansible puppet-mode helm which-key lsp-mode company-mode use-package magit gruvbox-theme auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

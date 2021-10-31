;; Basic emacs setup to install use-package

(require 'package)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)


(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; Load Functions
(add-to-list 'load-path "~/.emacs-d/functions")


;; set some emacs settings
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(set-fringe-mode 10)
(global-display-line-numbers-mode)
(set-default 'truncate-lines t)

(defalias 'yes-or-no-p 'y-or-n-p)


;; recent files
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")

;; Font
(add-to-list 'default-frame-alist '(font . "Iosevka SS08-14"))

;; Look and Feel
(use-package gruvbox-theme
	     :init
	     (load-theme 'gruvbox-dark-hard t))


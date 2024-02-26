;;; Start a new init.el

;;; Package Manager
(setq package-enable-at-startup nil)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight
(use-package straight
  :custom
  (straight-use-package-by-default t))

(use-package emacs
  :bind
  ("C-c r" . 'own/emacs-reload-config)
  :hook
  ((prog-mode . display-line-numbers-mode)
   (conf-mode . display-line-numbers-mode))
  :custom
  (gc-cons-threshold 100000000)
  (read-process-output-max (* 1024 1024))
  (backup-directory-alist `((".*" . ,temporary-file-directory)))
  (auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
  (create-lockfiles nil)
  (use-dialog-box nil)
  (column-number-mode 1)
  (vc-follow-symlinks t)
  (native-comp-async-report-warnings-errors nil)
  (enable-recursive-minibuffers t)
  (show-trailing-whitespace t)
  (tab-always-indent 'complete)
  (completion-cycle-threshold 3)

  :config
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (set-fringe-mode 10)
  (scroll-bar-mode -1)
  (set-default 'truncate-lines t)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (setopt use-short-answers t)

  (windmove-default-keybindings 'meta)
  (add-to-list 'default-frame-alist '(font . "MonaspaceNeonLight-12"))
  :init
  (defun own/emacs-reload-config()
    (interactive)
    (load-file "~/.emacs.d/init.el")))

(use-package savehist
  :init
  (savehist-mode))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(use-package base16-theme
  :demand
  :init
  (defun own/theme-custome-faces()
    (set-face-attribute 'org-block nil :background (face-attribute 'default :background))
    (set-face-attribute 'org-block-begin-line nil :background (face-attribute 'default :background))
    (set-face-attribute 'org-block-end-line nil :background (face-attribute 'default :background)))

  (defun own/theme-load-last-theme()
    (interactive)
    (load-theme current-theme t))

  (defun own/theme-switch-theme(theme)
    (interactive)
    (disable-theme current-theme)
    (setq current-theme theme)
    (own/theme-load-last-theme))

  (setq base16-theme-256-color-source "colors"
	base16-theme-distinct-fringe-background nil)

  (add-to-list 'custom-theme-load-path "~/.base16-themes/emacs/")
  (load-file "~/.emacs.d/personal/theme.el")
  (own/theme-load-last-theme)

  ;; Overwriting some face attributes, cause i like it
  (with-eval-after-load 'org-faces
    (if (daemonp)
	(add-hook 'server-after-make-frame-hook #'own/theme-custome-faces)
      (own/theme-custome-faces))))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package vertico
  :custom
  (vertico-count 13)
  (vertico-resize t)
  (vertico-cycle nil)
  (vertico-buffer-display-action '(display-buffer-reuse-window))
  :config
  (vertico-mode))

(use-package vertico-posframe
  :config
  (vertico-posframe-mode 1))


(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles basic-remote
		   orderless)))))

(use-package consult
  :bind
  (("C-s" . consult-line)
   ("C-c s" . consult-ripgrep)
   ("C-c b" . consult-buffer)
   ("C-c t t" . consult-org-agenda)))

(use-package corfu
  :custom
  (corfu-auto t)
  :init
  (global-corfu-mode))

(use-package which-key
  :custom
  (which-key-idle-delay 0.3)
  :init
  (which-key-mode))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 20)
  (doom-modeline-project-detection 'truncate-with-project)
  (doom-modeline-icon t))

(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-indexing-method 'hybrid)
  (projectile-project-search-path '(("~/projects/" . 4)))
  :config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (projectile-mode +1))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :config
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

  (smartparens-global-mode t))

(use-package highlight-indent-guides
  :hook
  (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive 'top))

(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package dashboard
  :after (nerd-icons)
  :config
  (setq dashboard-navigator-buttons
	`(;; line1
	  ((,(nerd-icons-octicon "nf-oct-mark_github" :height 1.1 :v-adjust 0.0)
	    "dotfiles"
	    "Browse Dotfiles"
	    (lambda (&rest _) (browse-url "https://github.com/sebastianrakel/dotfiles.git"))))))
  (dashboard-setup-startup-hook)
  :custom
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  (dashboard-startup-banner "~/.emacs.d/personal/images/avatar.png")
  (dashboard-set-navigator t)
  (dashboard-center-content t)
  (dashboard-show-shortcuts t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-display-icons-p t)
  (dashboard-set-footer nil)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-items '((recents  . 10)
		     (bookmarks . 5)
		     (projects . 5))))

(use-package flyspell
  :if (executable-find "ispell")
  :hook
  ((text-mode . flyspell-mode)
   (prog-mode . flyspell-prog-mode)))

(use-package direnv
  :config
  (direnv-mode))

(use-package org-modern
  :after org
  :hook
  (org-mode . org-modern-mode)
  :custom
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-auto-align-tags nil)
  (org-tags-column 0)
  (org-insert-heading-respect-content t))

(use-package magit)

(use-package eglot
  :straight (:type built-in)
  :custom
  (completion-category-overrides '((eglot (styles orderless))))
  (eglot-autoshutdown t)
  :commands eglot
  :hook
  (go-ts-mode . eglot-ensure))

(use-package go-mode
  :after eglot
  :hook
  ((go-ts-mode . own/eglot-format-buffer-on-save))
  :init
  (defun own/eglot-format-buffer-on-save ()
    (add-hook 'before-save-hook #'eglot-format-buffer -10 t)))

(use-package nix-mode)
(use-package puppet-mode)
(use-package docker)
(use-package dockerfile-mode)
(use-package yaml-mode)
(use-package powershell)
(use-package yuck-mode)
(use-package terraform-mode)
(use-package hcl-mode)

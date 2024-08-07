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
  ("C-c x" . 'real-terminal-open)
  ("C-c X" . 'real-terminal--open-with-current-directory)
  ("C-c q s" . 'own/emacs-open-config)
  ("C-c q d" . 'own/open-project-dir-dotfiles)
  ("C-c q p" . 'own/open-project-dir-dotfiles-private)
  ("C-c q n" . 'own/open-project-dir-nix)
  ("C-c q k" . 'own/open-known-hosts)
  ("C-<tab>" . 'completion-at-point)
  ("C-<down-mouse-1>" . 'xref-find-definitions-at-mouse)
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
  (completion-cycle-threshold 2)
  (warning-minimum-level :emergency)

  :config
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (set-fringe-mode 10)
  (scroll-bar-mode -1)
  (set-default 'truncate-lines t)
  (electric-pair-mode 1)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (setopt use-short-answers t)

  (windmove-default-keybindings 'meta)
  (if (member (system-name) '("odin" "sulu"))
      (add-to-list 'default-frame-alist '(font . "MonaspaceNeonExtraLight-16"))
    (add-to-list 'default-frame-alist '(font . "MonaspaceNeonExtraLight-14")))
  :init
  (defun own/emacs-reload-config()
    (interactive)
    (load-file "~/.emacs.d/init.el"))

  (load "~/.emacs.d/personal/conf.d/real-terminal")
  (load "~/.emacs.d/personal/conf.d/quick-jump")

  (let ((personal-settings "~/.emacs.d/init.personal.el"))
    (when (file-exists-p personal-settings)
      (load-file personal-settings)))

  (defun own/emacs-open-config() (interactive) (quick-jump-file "~/.emacs.d/init.el"))
  (defun own/open-known-hosts() (interactive) (quick-jump-file "~/.ssh/known_hosts"))
  (defun own/open-project-dir-nix() (interactive) (quick-jump-open-directory "~/.nix"))
  (defun own/open-project-dir-dotfiles() (interactive) (quick-jump-open-directory "~/.dotfiles"))
  (defun own/open-project-dir-dotfiles-private() (interactive) (quick-jump-open-directory "~/.dotfiles-private"))
  (defun own/treesit-install-langs()
    (interactive)
    (mapcar #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist)))

  (setq treesit-language-source-alist
	'((bash "https://github.com/tree-sitter/tree-sitter-bash")
	  (csharp "https://github.com/tree-sitter/tree-sitter-c-sharp")
	  (cmake "https://github.com/uyha/tree-sitter-cmake")
	  (css "https://github.com/tree-sitter/tree-sitter-css")
	  (elisp "https://github.com/Wilfred/tree-sitter-elisp")
	  (go "https://github.com/tree-sitter/tree-sitter-go" "v0.21.0")
	  (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
	  (html "https://github.com/tree-sitter/tree-sitter-html")
	  (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	  (json "https://github.com/tree-sitter/tree-sitter-json")
	  (make "https://github.com/alemuller/tree-sitter-make")
	  (markdown "https://github.com/ikatyang/tree-sitter-markdown")
	  (python "https://github.com/tree-sitter/tree-sitter-python")
	  (toml "https://github.com/tree-sitter/tree-sitter-toml")
	  (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	  (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))

  (setq major-mode-remap-alist
	'((bash-mode . bash-ts-mode)
	  (csharp-mode . csharp-ts-mode)
	  (js2-mode . js-ts-mode)
	  (typescript-mode . typescript-ts-mode)
	  (json-mode . json-ts-mode)
	  (css-mode . css-ts-mode)
	  (python-mode . python-ts-mode)
	  (go-mode . go-ts-mode)))
  (global-unset-key (kbd "C-<down-mouse-1>")))

(use-package savehist
  :init
  (savehist-mode))

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
  (setq vertico-posframe-parameters
	'((left-fringe . 8)
	  (right-fringe . 8)))
  (vertico-posframe-mode 0))


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
   ("C-c j e" . consult-flymake)
   ("C-c j l" . consult-line)))

(use-package consult-eglot
  :after consult
  :bind
  (("C-c j s" . consult-eglot-symbols)))

(use-package corfu
  :custom
  (corfu-auto t)
  :config
  (setq corfu-popupinfo-delay 0.5
	corfu-popupinfo-direction "right")
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))


(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'yasnippet-capf)
  :config
  (defun own/eglot-capf ()
    (setq-local completion-at-point-functions
		(list (cape-capf-super
		       #'eglot-completion-at-point
		       #'cape-dabbrev
		       #'cape-file
		       #'yasnippet-capf))))
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  (add-hook 'eglot-managed-mode-hook #'own/eglot-capf))

(use-package yasnippet-capf
  :after cape
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(use-package which-key
  :custom
  (which-key-idle-delay 0.3)
  :init
  (which-key-mode))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 40)
  (doom-modeline-project-detection 'truncate-with-project)
  (doom-modeline-icon t))

(use-package projectile
  :bind
  ("C-c R" . own/projectile-reload-projects)
  :bind-keymap
  (("C-c p" . projectile-command-map))
  :custom
  (projectile-indexing-method 'hybrid)
  :config
  (defun own/projectile-reload-projects() (interactive) (projectile-discover-projects-in-directory "~/projects/" 4))
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (projectile-mode +1))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package highlight-indent-guides
  :hook
  (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive 'top))

(use-package apheleia
  :ensure t
  :hook
  ((typescript-ts-mode . (lambda() (apheleia-mode -1))))
  :config
  ;; (push '(eslint-typescript
  ;; 	  . ("apheleia-npx" "eslint" filepath
  ;; 	     "--fix-dry-run"))
  ;; 	apheleia-formatters)
  
  ;; (setf (alist-get 'typescript-ts-mode apheleia-mode-alist)
  ;; 	'(eslint-typescript))

  (setq apheleia-log-debug-info 1)
  (apheleia-global-mode +1))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

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

(use-package org
  :straight (:type built-in)
  :custom
  (org-agenda-files (list "~/Nextcloud/Documents/Todos/")))

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

(use-package treemacs
  :bind
  (:map global-map
	("M-0" . treemacs-select-window)
	("C-x t t" . treemacs)))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package parrot
  :custom
  (parrot-set-parrot-type 'science)
  :config
  (parrot-mode))

(use-package yasnippet
  :init
  (yas-global-mode 1)
  :bind
  (("S-<Tab>" . 'yas-next-field))
  :config
  (advice-add 'yas--modes-to-activate :around
	      (defun yas--get-snippet-tables@tree-sitter (orig-fn &optional mode)
		(funcall orig-fn
			 (or (car-safe (rassq (or mode major-mode) major-mode-remap-alist))
			     mode)))))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package eglot
  :straight (:type built-in)
  :bind
  (:map eglot-mode-map
	("M-<return>" . eglot-code-actions)
	("C-c l f" . eglot-format-buffer))
  :custom
  (completion-category-overrides '((eglot (styles orderless))))
  (eglot-autoshutdown t)
  :commands eglot
  :hook
  (go-ts-mode . eglot-ensure)
  (csharp-ts-mode . eglot-ensure)
  :config
  (fset #'jsonrpc--log-event #'ignore)
  (add-to-list 'eglot-server-programs
	       `(csharp-ts-mode . ("OmniSharp" "-lsp" "-stdio"))))

(use-package eglot-booster
  :straight (eglot-booster :type git :host github :repo "jdtsmith/eglot-booster")
  :after eglot
  :config
  (eglot-booster-mode))

(use-package go-mode
  :after eglot
  :hook
  ((go-ts-mode . own/eglot-format-buffer-on-save)
   (go-ts-mode . own/eglot-organize-imports-add-hook))
  :init
  (defun own/eglot-organize-imports()
    (call-interactively 'eglot-code-action-organize-imports))
  (defun own/eglot-organize-imports-add-hook()
    (add-hook 'before-save-hook 'own/eglot-organize-imports nil t))
  (defun own/eglot-format-buffer-on-save ()
    (add-hook 'before-save-hook #'eglot-format-buffer -10 t)))

(use-package olivetti)

(use-package nix-mode)
(use-package puppet-mode)
(use-package docker)
(use-package dockerfile-mode)
(use-package yaml-mode)
(use-package powershell)
(use-package yuck-mode)
(use-package terraform-mode)
(use-package hcl-mode)
(use-package dart-mode
  :config
  (add-hook 'dart-mode-hook 'eglot-ensure))

(use-package typescript-mode
  :config
  (add-hook 'typescript-ts-mode-hook 'eglot-ensure))

(use-package flymake-eslint
  :straight `(flymake-eslint :type git :host github :repo "orzechowskid/flymake-eslint"
			     :fork (:host github
					  :repo "aecepoglu/flymake-eslint"))
  :hook
  (eglot-managed-mode . (lambda ()
                          (when (derived-mode-p 'typescript-ts-mode 'web-mode 'js-mode 'vue-mode)
                            (flymake-eslint-enable))))
  :config
  (setq flymake-eslint-executable '("npx" "eslint")))

(use-package web-mode
  :if (and (require 'treesit)
	   (require 'eglot))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-auto-close-style 2)
  (web-mode-enable-auto-closing t)
  :config
  (define-derived-mode vue-mode web-mode "Vue")
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

  (defun vue-eglot-init-options ()
    (let ((tsdk-path (expand-file-name
		      "lib"
		      (shell-command-to-string "npm list --global --parseable typescript | head -n1 | tr -d \"\n\""))))
      `(:typescript (:tsdk ,tsdk-path
			   :languageFeatures (:completion
					      (:defaultTagNameCase "both"
								   :defaultAttrNameCase "kebabCase"
								   :getDocumentNameCasesRequest nil
								   :getDocumentSelectionRequest nil)
					      :diagnostics
					      (:getDocumentVersionRequest nil))
			   :documentFeatures (:documentFormatting
					      (:defaultPrintWidth 100
								  :getDocumentPrintWidthRequest nil)
					      :documentSymbol t
					      :documentColor t)))))

  (add-to-list 'eglot-server-programs
	       `(vue-mode . ("vue-language-server" "--stdio" :initializationOptions ,(vue-eglot-init-options))))
  (add-hook 'vue-mode-hook 'eglot-ensure))

(use-package markdown-mode)
(use-package scad-mode)

(use-package openai
  :straight (openai :type git :host github :repo "emacs-openai/openai")
  :config
  (setq openai-key (getenv "OPENAI_API_KEY")))

(use-package chatgpt
  :straight (chatgpt :type git :host github :repo "emacs-openai/chatgpt")
  :after openai
  :config
  (setq chatgpt-model "gpt-4o"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval setq lsp-dart-flutter-sdk-dir
	   (getenv "FLUTTER_ROOT")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

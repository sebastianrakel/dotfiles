;;; emacsconfig-sebastianrakel -- My Emacs Config
;;; Commentary:

;;; Code:
;; Using elpaca for package management
(defvar elpaca-installer-version 0.5)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Config starts here

;; Functions
(defun own/theme-load-last-theme()
  (interactive)
  (load-theme current-theme t))

(defun own/theme-switch-theme(theme)
  (interactive)
  (disable-theme current-theme)
  (setq current-theme theme)
  (own/theme-load-last-theme))

(defun own/emacs-reload-config()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun own/emacs-open-config()
  (interactive)
  (switch-to-buffer (find-file-noselect "~/.emacs.d/init.el")))

(defun own/open-real-terminal--path (path)
  (let ((command (concat "herbstclient spawn alacritty --working-directory " path)))
    (message (concat "Open Terminal with command: " command))
    (shell-command command)))

(defun own/open-real-terminal--with-current-directory()
  (message "Open Terminal with current directory path")
  (own/open-real-terminal--path(file-name-directory (buffer-file-name))))

(defun own/open-real-terminal--with-projectile()
  (message "Open Terminal with projectile path")
  (own/open-real-terminal--path(projectile-project-root)))

(defun own/open-real-terminal()
  (interactive)
  (if (projectile-project-root)
      (own/open-real-terminal--with-projectile)
    (own/open-real-terminal--with-current-directory)))

;; Settings
;; Elpaca

(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))

(elpaca-wait)

;; Use-Package Settings
(setq use-package-always-ensure 't)

;; Basic UI/UX Settings
(tool-bar-mode -1) ;; Disable tool bar
(menu-bar-mode -1) ;; Disable menu bar
(toggle-scroll-bar -1) ;; Disable scroll bar
(pixel-scroll-precision-mode)
(scroll-bar-mode -1)
(setq scroll-preserve-screen-position t) ;; Keep the cursor at position and don't scroll away
(setq use-dialog-box nil)

(set-fringe-mode 10) ;; Width of sidebar with linenumbers

(global-display-line-numbers-mode) ;; I need line numbers
(column-number-mode 1) ;; Column Numbers

(add-to-list 'default-frame-alist '(font . "monospace-16"))

(defalias 'yes-or-no-p 'y-or-n-p) ;; Use short answer y or n

(setq vc-follow-symlinks t) ;; follow symlinks directly and don't ask
(setq dired-kill-when-opening-new-dired-buffer t)
(setq native-comp-async-report-warnings-errors nil)
(setq gc-cons-threshold (* 50 1000 1000))


(use-package doom-modeline
  :hook
  (elpaca-after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 40
	doom-modeline-project-detection 'truncate-with-project
	doom-modeline-icon t))

;; Theme Stuff
(use-package base16-theme
  :init
  (add-to-list 'custom-theme-load-path "~/.base16-themes/emacs/")
  (load-file "~/.emacs.d/personal/theme.el")
  (own/theme-load-last-theme))

;; File Handling Stuff
(setq create-lockfiles nil)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Basic text behaivor
(delete-selection-mode t) ;;Overwrite selected text
(set-default 'truncate-lines t) ;; Remove whitespace add line end
(setq revert-without-query '(".*")) ;;Keeps the file in sync with what is on the disk without a prompt to confirm
(save-place-mode 1)

;; Basic Keybinding stuff
;; Some keybinds needs a package, so keybinds with package deps are defined
;; in the use-package call
(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-c r") 'own/emacs-reload-config)
(global-set-key (kbd "C-c q s") 'own/emacs-open-config)
(global-set-key (kbd "C-c x") 'own/open-real-terminal)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-M-/") 'comment-region)

(use-package which-key
  :config
  (setq which-key-idle-delay 0.3)
  (which-key-mode))

;; Completion Framework
(use-package ivy :ensure t
  :diminish (ivy-mode . "")
  :bind
  (("C-c b" . 'ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	;; allow input not in order
        '((t   . ivy--regex-ignore-order))))

(use-package counsel
  :after ivy
  :bind
  (("M-x" . counsel-M-x))
  :config
  (counsel-mode))

(use-package swiper
  :after ivy
  :bind
  (("C-s" . 'swiper)))


;; Dashboard
(use-package dashboard
  :init
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook)
  :config
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner "~/.emacs.d/personal/images/avatar.png")
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
  (setq dashboard-items '((recents  . 10)
			  (bookmarks . 5)
			  (projects . 5)
			  (registers . 5))))

;; Project Management
(use-package projectile
  :bind
  (("C-c p" . 'projectile-command-map))
  :config
  (add-to-list 'projectile-globally-ignored-directories "*node_modules")
  (setq projectile-indexing-method 'hybrid)
  (projectile-mode 1))

(use-package counsel-projectile
  :after projectile)

;; Auto Complete
(use-package company
  :bind
  (("C-c <tab>" . 'company-complete))
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  
  (add-hook 'elpaca-after-init-hook 'global-company-mode))

;; Flycheck
(use-package flycheck
  :hook
  ((emacs-lisp-mode . own/flycheck-set-load-path))
  :bind
  (("C-c e l" . 'flycheck-error-list)
   ("C-c e n" . 'flycheck-next-error))
  :config
  (defun own/flycheck-set-load-path()
    (setq flycheck-emacs-lisp-load-path 'inherit))
  (add-hook 'elpaca-after-init-hook 'global-flycheck-mode))

;; LSP (Eglot/Treesitter)
(require 'eglot)
(setq eglot-confirm-server-initiated-edits nil
      eglot-events-buffer-size 0
      eglot-sync-connect nil
      eglot-connect-timeout nil
      eglot-autoshutdown t
      eglot-events-buffer-size 0)

(define-key eglot-mode-map (kbd "C-c c r") #'eglot-find-implementation)
(define-key eglot-mode-map (kbd "C-c c d") #'xref-find-definitions)
(define-key eglot-mode-map (kbd "C-c c f") #'eglot-format-buffer)
(define-key eglot-mode-map (kbd "C-c c R") #'eglot-rename)
(define-key eglot-mode-map (kbd "C-M-l") #'eglot-format-buffer)
(define-key eglot-mode-map (kbd "M-<return>") #'eglot-code-actions)

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
	(cmake "https://github.com/uyha/tree-sitter-cmake")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(go "https://github.com/tree-sitter/tree-sitter-go")
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
   (js2-mode . js-ts-mode)
   (typescript-mode . typescript-ts-mode)
   (json-mode . json-ts-mode)
   (css-mode . css-ts-mode)
   (python-mode . python-ts-mode)
   (go-mode . go-ts-mode)))


;; Git Stuff --- Magit is love
(use-package magit
  :init
  (remove-hook 'server-switch-hook 'magit-commit-diff)
  (remove-hook 'with-editor-filter-visit-hook 'magit-commit-diff))

(use-package forge
  :after magit
  :config
  (setq auth-sources '("~/.authinfo.gpg")))

;; direnv
(use-package direnv
  :config
  (direnv-mode)
  (direnv-update-environment))

;; Some packages for a better life
(use-package rainbow-mode)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yaml-mode)
(use-package yaml-pro
  :after yaml-mode
  :config
  (add-hook 'yaml-mode #'yaml-pro-mode))

(use-package yasnippet
  :after company
  :config
  (add-hook 'elpaca-after-init-hook (yas-global-mode 1))
  (advice-add 'yas--modes-to-activate :around
	      (defun yas--get-snippet-tables@tree-sitter (orig-fn &optional mode)
		(funcall orig-fn
			 (or (car (rassq (or mode major-mode) major-mode-remap-alist))
			     mode)))))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package smartparens
  :config
  (add-hook 'elpaca-after-init-hook (smartparens-global-mode t)))

;; vertical lines to show current block
(use-package highlight-indent-guides
  :hook
  ((prog-mode-hook . highlight-indent-guides-mode))
  :config
  (setq highlight-indent-guides-method 'character
	highlight-indent-guides-responsive 'top))


;; Programming Language specific stuff
;; Elisp

;; Web/Typescript
(use-package web-mode
  :if (and (require 'treesit)
           (require 'eglot))
  :after eglot
  :config
  (setq web-mode-markup-indent-offset 2
	web-mode-tag-auto-close-style 2
	web-mode-css-indent-offset 2
	web-mode-enable-auto-closing t)
  (define-derived-mode vue-mode web-mode "Vue")
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
  (add-hook 'vue-mode-hook 'eglot-ensure)

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
	       `(vue-mode . ("vue-language-server" "--stdio" :initializationOptions ,(vue-eglot-init-options)))))

(use-package typescript-mode)

;; Golang
(use-package go-mode
  :if (and (require 'treesit)
           (treesit-available-p))
  :hook
  ((go-ts-mode . go-save-hooks))
  :config
  (defun go-save-hook()
    (when (eq major-mode 'go-ts-mode)
      (lambda() ((interactive) (with-demoted-errors (eglot-code-action-organize-imports))))
      (eglot-format-buffer)))
  (defun go-save-hooks()
    (add-hook 'before-save-hook 'go-save-hook))
  (setq go-ts-mode-hook go-mode-hook)
  (add-hook 'go-ts-mode 'eglot-ensure))

;; Puppet
(use-package puppet-mode
  :hook
  ((puppet-mode . puppet-save-hooks))
  :config
  (defun puppet-lint-buffer()
    (let ((command (concat
		    "puppet-lint --with context "
		    "--log-format \"%{path}:%{line}: %{kind}: %{message} (%{check})\"")))
      (puppet-lint command)))

  (defun puppet-save-hooks()
    (add-hook 'before-save-hook #'delete-trailing-whitespace 'local)
    (add-hook 'after-save-hook 'puppet-lint-buffer 'local))

  (add-to-list
   'auto-mode-alist '("\\`Puppetfile\\'" . ruby-mode)))

;; Dockerfile
(use-package docker)
(use-package dockerfile-mode)

;; Cloud Stuff (Terraform, Nomad, etc)
(use-package hcl-mode)

(use-package terraform-mode
  :mode ("\\.tf\\'" . terraform-mode)
  :hook
  ((terraform-mode . 'eglot-ensure)))

;; Nix Stuff
(use-package nix-mode)

;; Org-Mode

(global-set-key (kbd "C-c t t") 'org-agenda)
(setq org-agenda-files (list "~/.todos"))

;;; init.el ends here

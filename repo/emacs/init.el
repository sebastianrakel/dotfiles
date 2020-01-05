(require 'package)

(setq package-enable-at-startup nil)
(setq vc-follow-symlinks t)

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" default)))
 '(package-selected-packages
   (quote
    (meson-mode jenkins jenkins-watch multiple-cursors powershell platformio-mode html-mode helm-gitignore web-mode haxe-imports haxe-mode crystal-playground dired-single ox-reveal epresent org-tree-slide chess twittering-mode nginx-mode anaconda-mode crystal-mode notmuch rust-mode org-jira android-mode gradle-mode scad-mode scad-preview treemacs puppet-mode flymake-puppet yaml-mode which-key use-package smartparens restclient rainbow-delimiters powerline org-bullets nyan-mode markdown-mode magit lua-mode json-mode jedi helm-projectile helm-dash haskell-mode haml-mode groovy-mode go-playground go-dlv go-autocomplete dockerfile-mode base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)

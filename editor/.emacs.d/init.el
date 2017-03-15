(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

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
 '(package-selected-packages
   (quote
    (nginx-mode ansible pony-mode python-django jinja2-mode php-mode ng2-mode omnisharp helm-dash arduino-mode sublimity helm-gitlab chess confluence go-playground go-mode org-bullets auto-complete use-package base16-theme)))
 '(safe-local-variable-values
   (quote
    ((pony-settings
      (make-pony-project :python "/home/sebastian/Projects/hodor/venv/bin/python" :pythonpath "/home/sebastian/Projects/hodor/venv/lib" :settings "settings" :appsdir "/home/sebastian/Projects/hodor"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

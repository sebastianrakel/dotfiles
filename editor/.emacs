
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/package")
(load "~/.emacs.d/auto-complete")
(load "~/.emacs.d/color-theme")
(load "~/.emacs.d/common")
(load "~/.emacs.d/ecb")
(load "~/.emacs.d/gud")
(load "~/.emacs.d/ruby")
(load "~/.emacs.d/magit")
(load "~/.emacs.d/google-go")
(load "~/.emacs.d/haml")
(load "~/.emacs.d/multi-cursor")
(load "~/.emacs.d/c")
(load "~/.emacs.d/lua")
(load "~/.emacs.d/helm-settings")
(load "~/.emacs.d/projectile")
(load "~/.emacs.d/markdown")
(load "~/.emacs.d/jenkins")
(load "~/.emacs.d/groovy")
(load "~/.emacs.d/powerline")
(load "~/.emacs.d/which-key")
(load "~/.emacs.d/elisp")
(load "~/.emacs.d/prog")
; (load "~/.emacs.d/flycheck")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(package-selected-packages
   (quote
    (smartparens rainbow-delimiters yaml-mode xml-rpc which-key virtualenvwrapper rubocop robe python-mode python-environment python-django powerline nginx-mode multiple-cursors markdown-mode magit lua-mode let-alist jira helm-projectile helm-describe-modes helm-dash helm-ag haml-mode groovy-mode go-stacktracer go-mode go-errcheck go-autocomplete evil enh-ruby-mode ecb dockerfile-mode docker django-mode django-manage color-theme-solarized cmake-project cmake-mode cmake-ide bash-completion base16-theme auto-complete-c-headers arduino-mode ansible-doc ansible 0blayout))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

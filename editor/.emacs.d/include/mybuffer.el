;;; MyBuffer --- Own startup buffer

;;; Commentary:

;;; Code:
(defconst my-startup-buffer-name "*mystartup*"
  "The name of my startup buffer.")

(defconst mybuffer--banner-length 128
  "Width of a banner.")

(defconst mybuffer-logo-title ""
  "Buffer Image Title.")

(defvar mybuffer-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [down-mouse-1] 'widget-button-click)
    (define-key map (kbd "RET") 'widget-button-press)

    (define-key map [tab] 'widget-forward)
    (define-key map (kbd "J") 'widget-forward)
    (define-key map (kbd "C-i") 'widget-forward)

    (define-key map [backtab] 'widget-backward)
    (define-key map (kbd "K") 'widget-backward)

    (define-key map (kbd "C-r") 'spacemacs-buffer/refresh)
    (define-key map "q" 'quit-window)
    map)
  "Keymap for mybuffer mode.")

(with-eval-after-load 'evil
  (evil-make-overriding-map mybuffer-mode-map 'motion))

(defun insert-image-banner(banner)
  "Display an image banner."
  (when (file-exists-p banner)
    (let* ((title mybuffer-logo-title)
           (spec (create-image banner))
           (size (image-size spec))
           (width (car size))
           (left-margin (max 0 (floor (- (window-width) width) 2))))
      (goto-char (point-min))
      (insert "\n")
      (insert (make-string left-margin ?\ ))
      (insert-image spec)
      (insert "\n\n")
      (insert (make-string (max 0 (floor (/ (- (window-width)
                                        (+ (length title) 1)) 2))) ?\ ))
      (insert (format "%s\n\n" title)))))

(defun create-mybuffer()
  (with-current-buffer (get-buffer-create my-startup-buffer-name))
  (draw-mybuffer)
  (switch-to-buffer my-startup-buffer-name))

(defun draw-mybuffer()
  (with-current-buffer (get-buffer my-startup-buffer-name)
    (save-excursion
      (insert-image-banner "~/.emacs.d/images/emacs_banner.png")
      (draw-favorites)
      (insert "\n\n")
      (load-recent-files)
      (setq buffer-read-only t))))

(defun draw-favorites()
  (interactive)
  (switch-to-buffer my-startup-buffer-name)
  (widget-insert " ")
  (widget-create 'url-link
                 :tag (propertize "edit myinit.org" 'face 'font-lock-keyword-face)
                 :action (lambda (widget &rest ignore)
                           (find-file "~/.emacs.d/myinit.org")))
  (widget-insert " ")
  (widget-create 'url-link
                 :tag (propertize "dotfiles" 'face 'font-lock-keyword-face)
                 :help-echo "Open my dotfiles."
                 :mouse-face 'highlight
                 :follow-link "\C-m"
                 "https://github.com/sebastianrakel/dotfiles"))

(defun load-recent-files()
  (let ((list-separator "\n\n"))
    (insert "Recent Files:")
    (insert list-separator)
    (dolist (x (recentf-elements 10))
      (create-link x)
      (insert list-separator)))
  (use-local-map widget-keymap)
  (widget-setup))

(defun create-link(filename)
  (interactive)
  (switch-to-buffer my-startup-buffer-name)
  (widget-insert "")
  (widget-create 'link
                 :value filename
                 :action (lambda (widget &rest ignore)
                           (find-file (widget-value widget)))))
          
(defun setup-startup-hook()
  (add-hook 'emacs-startup-hook
            (lambda()
              (create-mybuffer))))

(defun setup-mybuffer-environment()
  (setq inhibit-startup-screen t)
  (setq initial-buffer-choice nil)
  (setq inhibit-startup-screen t))

(provide 'mybuffer)
;;; mybuffer.el ends here

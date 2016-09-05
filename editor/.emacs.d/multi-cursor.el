(require 'multiple-cursors)
(global-set-key (kbd "C-S-l") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(eval-after-load "multiple-cursors-core"
  '(progn
     (define-key mc/keymap (kbd "<return>") nil)
     (define-key mc/keymap (kbd "C-j") 'multiple-cursors-mode)))

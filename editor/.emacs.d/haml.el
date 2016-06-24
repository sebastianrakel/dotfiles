; haml stuff
(require 'haml-mode)
(defun my-haml-hook()
  (message "Haml Mode")
  (linum-mode 1)
  (define-key haml-mode-map "\C-m" 'newline-and-indent)
)

(add-hook 'haml-mode-hook 'my-haml-hook)

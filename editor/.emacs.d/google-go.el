(defun my-go-mode-hook ()
  (linum-mode 1)
  (rainbow-delimiters-mode)
  (smartparens-mode)
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v -gcflags '-N -l' && go test -v && go vet"))
  
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  
  (local-set-key (kbd "<f5>") 'gud-cont)
  (local-set-key (kbd "C-<f5>") 'gdb)  
  (local-set-key (kbd "C-<f6>") 'compile)
  (local-set-key (kbd "<f6>") 'recompile)

  (local-set-key (kbd "<f9>") 'gud-break)
  (local-set-key (kbd "C-<f9>") 'gud-remove)
  (local-set-key (kbd "<f10>") 'gud-next)
  (local-set-key (kbd "<f11>") 'gud-step)
  (local-set-key (kbd "C-<f11>") 'gdb-up))
 
(add-hook 'go-mode-hook 'my-go-mode-hook)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

(defun my-make-clean()  
  (interactive)
  (compile "make clean"))

(defun my-make()
  (interactive)
  (compile "make"))

(defun build-and-run()
  (interactive)
  (setq is-compile-run t)
  (my-make))

(defun after-compile(buffer msg)
  (when (string-match "^finished" msg)
    (when is-compile-run t)
      (setq is-compile-run nil)
      (run-or-continue)))

(defun run-or-continue()
  (interactive)
  (gdb))
  
(defun run-debugger()
  (interactive)
  (gdb)
  (gud-run))  

(defun my-c-hook()
  (message "C Mode")
  (linum-mode 1)

  (setq c-default-style "linux"
        c-basic-offset 4)

  (local-set-key (kbd "<f5>") 'gud-cont)
  (local-set-key (kbd "C-<f5>") 'run-debugger)  
  (local-set-key (kbd "<f6>") 'my-make)
  (local-set-key (kbd "<f7>") 'my-make-clean)

  (local-set-key (kbd "<f9>") 'gud-break)
  (local-set-key (kbd "C-<f9>") 'gud-remove)
  (local-set-key (kbd "<f10>") 'gud-next)
  (local-set-key (kbd "<f11>") 'gud-step)
  (local-set-key (kbd "C-<f11>") 'gdb-up)

  )

(add-hook 'c-initialization-hook 'my-c-hook)


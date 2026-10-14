;;; do-ui.el --- User interface -*- lexical-binding: t -*-

(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)

(dolist (hook '(term-mode-hook
                eshell-mode-hook
                shell-mode-hook
                help-mode-hook
                org-mode-hook))
  (add-hook hook
            (lambda ()
              (display-line-numbers-mode -1))))

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)
         ("M-O" . ace-delete-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-scope 'frame))

(use-package command-log-mode
  :ensure t
  :bind ("C-c o" . command-log-mode)
  :config
  (defun my/command-log-mode-cleanup ()
    "Close the command-log window when logging is disabled."
    (unless command-log-mode
      (let ((window (get-buffer-window " *command-log*")))
        (when window
          (delete-window window)))))
  (add-hook 'command-log-mode-hook
            #'my/command-log-mode-cleanup)
  (with-eval-after-load 'command-log-mode
    (when command-log-mode
      (clm/open-command-log-buffer))))

(use-package popper
  :ensure t
  :bind (("C-'"   . popper-toggle)
         ("M-'"   . popper-cycle)
         ("C-M-'" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          "\\*Warnings\\*"
          "\\*Flymake diagnostics.*\\*"
          "\\*Flycheck error messages\\*"
          "\\*Process List\\*"
          "\\*xref\\*"
          "\\*ert\\*"
          help-mode
          compilation-mode
          rg-mode
          inf-ruby-mode
          sqli-mode
          geiser-repl-mode))
  (add-hook 'after-init-hook
            (lambda ()
              (popper-mode 1)
              (popper-echo-mode 1))))

(use-package vundo
  :ensure t
  :bind ("C-x u" . vundo))

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.3)
  (which-key-idle-secondary-delay 0.05))

(provide 'do-ui)

;;; do-ui.el ends here

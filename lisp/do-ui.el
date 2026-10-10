;;; do-ui.el --- UI configuration -*- lexical-binding: t -*-

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)
         ("M-O" . ace-delete-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-scope 'frame))

(use-package command-log-mode
  :ensure t
  :bind (("C-c o" . command-log-mode))
  :config
  (add-hook 'command-log-mode-hook
            (lambda ()
              (if command-log-mode
                  (clm/open-command-log-buffer)
                (let ((window (get-buffer-window " *command-log*")))
                  (when window (delete-window window)))))))

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
  (popper-mode 1)
  (popper-echo-mode 1))

(use-package vundo
  :ensure t
  :bind ("C-x u" . vundo)
  :config
  (setq vundo-glyph-alist vundo-unicode-symbols))

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.3
        which-key-idle-secondary-delay 0.05))

(provide 'do-ui)

;;; do-ui.el ends here

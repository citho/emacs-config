;;; do-ui.el --- UI configuration -*- lexical-binding: t -*-

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)
         ("M-O" . ace-delete-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package command-log-mode
  :ensure t
  :bind (("C-c e M" . command-log-mode)
         ("C-c e L" . clm/open-command-log-buffer)))

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
          help-mode
          compilation-mode))
  (popper-mode 1)
  (popper-echo-mode 1))

(use-package vundo
  :ensure t
  :bind
  (("C-c u" . vundo)))

(use-package winner
  :ensure nil
  :bind (("C-c left" . winner-undo)
         ("C-c right" . winner-redo))
  :init
  (winner-mode 1))

(provide 'do-ui)

;;; do-ui.el ends here

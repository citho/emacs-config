;;; do-version-control.el --- Git configuration -*- lexical-binding: t -*-

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

(use-package diff-hl
  :ensure t
  :hook ((dired-mode . diff-hl-dired-mode)
         (prog-mode . turn-on-diff-hl-mode)
         (vc-dir-mode . turn-on-diff-hl-mode))
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1)
  (unless (display-graphic-p)
    (diff-hl-margin-mode 1)))

(provide 'do-version-control)

;;; do-version-control.el ends here

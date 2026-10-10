;;; do-vc.el --- Guarding Version Control systems configuration -*- lexical-binding: t -*-

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

(use-package diff-hl
  :ensure t
  :bind (:map diff-hl-mode-map
              ("M-]" . diff-hl-next-hunk)
              ("M-[" . diff-hl-previous-hunk)
              ("C-c g h" . diff-hl-show-hunk)
              ("C-c g r" . diff-hl-revert-hunk)
              ("C-c g s" . diff-hl-stage-current-hunk))
  :init
  (global-diff-hl-mode 1)
  :config
  (diff-hl-flydiff-mode 1)
  (add-hook 'diff-hl-flydiff-mode-hook
            (lambda ()
              (when (> (buffer-size) 1000000)
                (diff-hl-flydiff-mode -1))))
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (with-eval-after-load 'magit
    (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
    (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))
  (unless (display-graphic-p)
    (diff-hl-margin-mode 1)))

(provide 'do-vc)

;;; do-vc.el ends here

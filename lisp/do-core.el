;;; do-core.el --- Core behavior -*- lexical-binding: t -*-

(use-package gcmh
  :ensure t
  :demand t
  :init
  (setq gcmh-high-cons-threshold (* 128 1024 1024)
        gcmh-low-cons-threshold (* 16 1024 1024)
        gcmh-idle-delay 10)
  :config
  (gcmh-mode 1))

(use-package no-littering
  :ensure t
  :config
  (setq custom-file
        (no-littering-expand-etc-file-name "custom.el"))
  (when (file-readable-p custom-file)
    (load custom-file 'noerror 'nomessage))
  (setq backup-directory-alist
        `(("." . ,(no-littering-expand-var-file-name "backups/"))))
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(setq global-auto-revert-non-file-buffers t
      auto-revert-use-notify t
      ring-bell-function #'ignore
      use-dialog-box nil
      use-file-dialog nil
      sentence-end-double-space nil
      make-backup-files t
      history-length 200
      recentf-max-saved-items 5
      save-interprogram-paste-before-kill t
      confirm-kill-processes nil)

(setq-default indent-tabs-mode nil
              tab-width 4
              fill-column 88)

(setq use-package-compute-statistics t)

(savehist-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)
(column-number-mode 1)
(save-place-mode 1)
(show-paren-mode 1)
(recentf-mode 1)
(winner-mode 1)
(blink-cursor-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)

(setq enable-recursive-minibuffers t
      minibuffer-depth-indicate-mode t)

(setq modus-operandi-palette-overrides
      '((bg-mode-line-active bg-blue-intense)
        (fg-mode-line-active fg-main)))

(load-theme 'modus-operandi t)

(provide 'do-core)

;;; do-core.el ends here

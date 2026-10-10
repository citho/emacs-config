;;; do-settings.el --- Personal configuration settings -*- lexical-binding: t -*-

(global-hl-line-mode 1)
(global-auto-revert-mode 1)
(column-number-mode 1)
(save-place-mode 1)
(show-paren-mode 1)
(winner-mode 1)
(blink-cursor-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)

(setq-default indent-tabs-mode nil)
(setq global-auto-revert-non-file-buffers t
      auto-revert-use-notify t)

(setq make-backup-files t)

(setq modus-operandi-palette-overrides
      '((bg-mode-line-active bg-blue-intense)
        (fg-mode-line-active fg-main)))

(load-theme 'modus-operandi t)

(provide 'do-settings)

;;; do-settings.el ends here

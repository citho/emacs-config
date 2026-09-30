;;; do-settings.el --- Personal configuration settings -*- lexical-binding: t -*-

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(column-number-mode 1)
(save-place-mode 1)
(show-paren-mode 1)

(blink-cursor-mode 1)

(delete-selection-mode 1)
(electric-pair-mode 1)

(setq-default indent-tabs-mode nil)

(setq make-backup-files t)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

(use-package autorevert
  :ensure nil
  :custom
  (auto-revert-use-notify nil)
  :config
  (global-auto-revert-mode t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)

  (which-key-add-key-based-replacements
    "C-c a l" "language"
    "C-c a s" "search"))

(setq modus-operandi-palette-overrides
      '((bg-mode-line-active bg-blue-intense)
        (fg-mode-line-active fg-main)))

(load-theme 'modus-operandi t)

(provide 'do-settings)

;;; do-settings.el ends here

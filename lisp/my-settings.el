;;; my-settings.el --- Personal configuration settings -*- lexical-binding: t -*-

;;; Startup
(setq inhibit-startup-screen nil)


;;; UI
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-hl-line-mode 1)
(column-number-mode 1)
(save-place-mode 1)
(show-paren-mode 1)

(setq-default cursor-type 'bar)
(blink-cursor-mode 1)

;;; Editing
(delete-selection-mode 1)
(electric-pair-mode 1)

(setq-default indent-tabs-mode nil)

;;; Files
(setq make-backup-files t)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

;;; Which-Key
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)

  (which-key-add-key-based-replacements
    "C-c a l" "language"
    "C-c a s" "search"))

;;; Themes
(load-theme 'modus-operandi t)

;;; Experiment
(provide 'my-settings)

;;; my-settings.el ends here

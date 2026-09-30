;;; do-dired.el --- Dired configuration -*- lexical-binding: t -*-

(use-package dired
  :ensure nil
  :bind (("C-x C-j" . dired-jump))
  :config
  (setq dired-listing-switches "-alh"
        dired-kill-when-opening-new-dired-buffer t))

(provide 'do-dired)

;;; do-dired.el ends here

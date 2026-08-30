;;; my-dired.el --- Dired configuration -*- lexical-binding: t -*-

;;; Dired
(use-package dired
  :ensure nil
  :commands dired
  :config
  (setq dired-listing-switches "-alh"
        dired-kill-when-opening-new-dired-buffer t))

(provide 'my-dired)

;;; my-dired.el ends here

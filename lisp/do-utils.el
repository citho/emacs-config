;;; do-utils.el --- Personal utility functions -*- lexical-binding: t -*-

(defun my-edit-init-file ()
  "Open the user's init file."
  (interactive)
  (find-file user-init-file))

(defun my-reload-init ()
  "Reload the user's init file."
  (interactive)
  (load-file user-init-file))

(defun my-open-emacs-directory ()
  "Open the Emacs configuration directory."
  (interactive)
  (dired user-emacs-directory))

(provide 'do-utils)

;;; do-utils.el ends here

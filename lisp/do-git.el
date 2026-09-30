;;; do-git.el --- Git configuration -*- lexical-binding: t -*-

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

(provide 'do-git)

;;; do-git.el ends here

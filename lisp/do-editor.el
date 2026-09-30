;;; do-edior.el --- Editor configuration -*- lexical-binding: t -*-

(use-package activities
  :ensure t
  :init
  (activities-mode)
  :custom
  (activities-bookmark-store t)
  :bind
  (("C-x C-a d" . activities-define)
   ("C-x C-a a" . activities-resume)
   ("C-x C-a s" . activities-suspend)
   ("C-x C-a k" . activities-kill)
   ("C-x C-a g" . activities-revert)
   ("C-x C-a l" . activities-list)))

(use-package expreg
  :bind
  (("C-=" . expreg-expand)
   ("C--" . expreg-contract)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package wgrep
  :ensure t
  :commands wgrep-change-to-wgrep-mode
  :config
  (setq wgrep-change-readonly-file t)
  (setq wgrep-auto-save-buffer t))

(provide 'do-editor)

;;; do-editor.el ends here

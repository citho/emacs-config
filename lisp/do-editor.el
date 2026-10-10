;;; do-edior.el --- Editor configuration -*- lexical-binding: t -*-

(use-package activities
  :ensure t
  :bind (("C-x C-a C-n" . activities-new)
         ("C-x C-a C-d" . activities-define)
         ("C-x C-a C-a" . activities-resume)
         ("C-x C-a C-s" . activities-suspend)
         ("C-x C-a C-k" . activities-kill)
         ("C-x C-a RET" . activities-switch)
         ("C-x C-a b" . activities-switch-buffer)
         ("C-x C-a g" . activities-revert)
         ("C-x C-a l" . activities-list))
  :init
  (activities-mode 1)
  :custom
  (activities-bookmark-store t))

(use-package expreg
  :bind (("C-=" . expreg-expand)
         ("C--" . expreg-contract))
  :config
  (add-hook 'text-mode-hook
            (lambda ()
              (add-to-list 'expreg-functions #'expreg--sentence))))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package wgrep
  :ensure t
  :bind (:map grep-mode-map
              ("C-c C-p" . wgrep-change-to-wgrep-mode))
  :config
  (setq wgrep-change-readonly-file t)
  (setq wgrep-auto-save-buffer t))

(provide 'do-editor)

;;; do-editor.el ends here

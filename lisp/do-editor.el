;;; do-edior.el ---Editing behavior -*- lexical-binding: t -*-

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

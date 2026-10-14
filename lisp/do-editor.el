;;; do-editor.el ---Editing behavior -*- lexical-binding: t -*-

(use-package expreg
  :bind (("C-=" . expreg-expand)
         ("C--" . expreg-contract))
  :init
  (defun my/expreg-add-sentence-expansion ()
    "Add sentence expansion to Expreg when available."
    (when (boundp 'expreg-functions)
      (add-to-list 'expreg-functions #'expreg--sentence)))

  (add-hook 'text-mode-hook
            #'my/expreg-add-sentence-expansion))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package wgrep
  :ensure t
  :after (grep)
  :bind (:map grep-mode-map
              ("C-c C-p" . wgrep-change-to-wgrep-mode))
  :custom
  (wgrep-change-readonly-file t)
  (wgrep-auto-save-buffer t))

(provide 'do-editor)

;;; do-editor.el ends here

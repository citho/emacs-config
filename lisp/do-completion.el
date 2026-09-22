;;; my-completion.el --- Completion configuration -*- lexical-binding: t -*-

;;; Vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

;;; Vertico-Directoty
(use-package vertico-directory
  :after vertico
  :ensure nil
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :bind (:map vertico-map
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)))

;;; Orderless
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

;;; Marginalia
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

;;; Consult
(use-package consult
  :ensure t
  :commands
  (consult-imenu
   consult-ripgrep
   consult-yank-pop
   consult-flymake
   consult-git-grep)
  :bind
  (("C-x b" . consult-buffer)
   ("C-x 4 b" . consult-buffer-other-window)
   ("C-x p b" . consult-project-buffer)
   ("C-s" . consult-line)
   ("M-y" . consult-yank-pop)
   ("M-g f" . consult-flymake)
   ("M-g g" . consult-goto-line)
   ("M-g i" . consult-imenu)
   ("M-g o" . consult-outline)
   ("M-s d" . consult-find)
   ("M-s G" . consult-git-grep)
   ("M-s r" . consult-ripgrep)))

;;; Corfu
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  :init
  (global-corfu-mode 1))

;;; Cape
(use-package cape
  :ensure t
  :config
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

;;; Embark
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :ensure t
  :after (embark consult))

(use-package ace-window
  :ensure t
  :bind
  ("M-o" . ace-window)
  ("M-O" . ace-delete-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package expreg
  :bind
  (("C-=" . expreg-expand)
   ("C--" . expreg-contract)))

(use-package wgrep
  :ensure t
  :config
  (setq wgrep-change-readonly-file t)
  (setq wgrep-auto-save-buffer t))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(provide 'do-completion)

;;; my-completion.el ends here

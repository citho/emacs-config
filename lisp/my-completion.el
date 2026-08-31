;;; my-completion.el --- Completion configuration -*- lexical-binding: t -*-

;;; Vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

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
  (consult-buffer
   consult-line
   consult-imenu
   consult-ripgrep)
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)))

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
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(provide 'my-completion)

;;; my-completion.el ends here

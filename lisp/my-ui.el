;;; my-ui.el --- UI configuration -*- lexical-binding: t -*-

(use-package dimmer
  :ensure t
  :custom
  (dimmer-fraction 0.3)
  :config
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-mode t))

(use-package vundo
  :ensure t
  :bind
  (("C-c u" . vundo)))

(provide 'my-ui)

;;; my-ui.el ends here

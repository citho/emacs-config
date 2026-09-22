;;; my-ui.el --- UI configuration -*- lexical-binding: t -*-

(use-package dimmer
  :ensure t
  :custom
  (dimmer-fraction 0.3)
  (dimmer-adjustment-mode 'be-cool)
  (dimmer-watch-frame-focus-events t)
  :config
  (defun my/dimmer-prevent-minibuffer-p ()
    "Mencegah dimming jika minibuffer saat ini sedang aktif."
    (active-minibuffer-window))
  
  (setq dimmer-prevent-dimming-predicates
        '(window-minibuffer-p
          my/dimmer-prevent-minibuffer-p))

  (add-to-list 'dimmer-buffer-exclusion-predicates
               (lambda (buffer)
                 (with-current-buffer buffer
                   (memq major-mode '(dired-mode
                                      vundo-mode
                                      magit-status-mode
                                      magit-diff-mode
                                      magit-log-mode
                                      vertico-mode
                                      corfu-mode
                                      embark-collect-mode)))))
  
  
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-mode t))

(use-package vundo
  :ensure t
  :bind
  (("C-c u" . vundo)))

(use-package popper
  :ensure t
  :bind (("C-'"   . popper-toggle)
         ("M-'"   . popper-cycle)
         ("C-M-'" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (popper-mode 1)
  (popper-echo-mode 1))

(use-package autorevert
  :ensure nil
  :custom
  (auto-revert-use-notify nil)
  :config
  (global-auto-revert-mode t))

(use-package burly
  :ensure t
  :commands
  (burly-bookmark-windows burly-open-bookmark))

(use-package command-log-mode
  :ensure t
  :bind (("C-c e M" . command-log-mode)
         ("C-c e L" . clm/open-command-log-buffer)))

(provide 'do-ui)

;;; my-ui.el ends here

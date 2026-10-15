;;; do-tools.el --- Tools and navigation -*- lexical-binding: t -*-

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
  (setq activities-bookmark-store t)
  (add-hook 'after-init-hook
            (lambda ()
              (require 'activities)
              (activities-mode 1))))

(use-package dired
  :ensure nil
  :bind (("C-x C-j" . dired-jump))
  :custom
  (dired-listing-switches "-alh")
  (dired-kill-when-opening-new-dired-buffer t))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

(use-package diff-hl
  :ensure t
  :bind (:map diff-hl-mode-map
              ("M-]" . diff-hl-next-hunk)
              ("M-[" . diff-hl-previous-hunk)
              ("C-c g h" . diff-hl-show-hunk)
              ("C-c g r" . diff-hl-revert-hunk)
              ("C-c g s" . diff-hl-stage-current-hunk))
  :init
  (defun my/diff-hl-disable-flydiff-on-large-buffer ()
    "Disable Diff HL flydiff in buffers larger than 1 MB."
    (when (and diff-hl-flydiff-mode
               (> (buffer-size) 1000000))
      (diff-hl-flydiff-mode -1)))
  (add-hook 'after-init-hook
            (lambda ()
              (require 'diff-hl)
              (global-diff-hl-mode 1)
              (diff-hl-flydiff-mode 1)
              (unless (display-graphic-p)
                (diff-hl-margin-mode 1))))

  :config
  (add-hook 'diff-hl-flydiff-mode-hook
            #'my/diff-hl-disable-flydiff-on-large-buffer)
  (add-hook 'dired-mode-hook
            #'diff-hl-dired-mode)
  (with-eval-after-load 'magit
    (add-hook 'magit-pre-refresh-hook
              #'diff-hl-magit-pre-refresh)
    (add-hook 'magit-post-refresh-hook
              #'diff-hl-magit-post-refresh)))

(use-package gptel
  :ensure t
  :commands (gptel gptel-menu)
  :config
  (gptel-make-openai "OpenRouter"
    :host "openrouter.ai"
    :protocol "https"
    :endpoint "/api/v1/chat/completions"
    :stream t
    :key (lambda ()
           (getenv "OPENROUTER_API_KEY"))
    :models '(openai/gpt-4o
              google/gemini-2.5-flash
              deepseek/deepseek-chat))
  (setq gptel-max-tokens 2048)
  (setq gptel-backend
        (gptel-get-backend "OpenRouter"))
  (setq gptel-model 'openai/gpt-4o)
  (add-hook 'gptel-mode-hook
            (lambda ()
              (org-mode))))

(use-package vterm
  :ensure t
  :commands (vterm vterm-mode vterm-other-window)
  :bind (("<f7>" . vterm)
         ("C-c t" . my-vterm-custom-buffer-name))
  :custom
  (vterm-shell "/bin/bash")
  (vterm-max-scrollback 20000)
  (vterm-kill-buffer-on-exit t)
  (vterm-copy-exclude-prompt t)
  (vterm-term-environment-variable "xterm-256color")
  :config
  (defun my-vterm-custom-buffer-name (name)
    "Open a new vterm buffer with a specified name."
    (interactive "sEnter buffer name: ")
    (let ((buffer (get-buffer-create (concat "*vterm-" name "*"))))
      (with-current-buffer buffer
        (unless (derived-mode-p 'vterm-mode)
          (vterm-mode)))
      (switch-to-buffer buffer))))


(provide 'do-tools)

;;; do-tools.el ends here

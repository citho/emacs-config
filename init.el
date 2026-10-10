;;; init.el --- My Emacs configuration -*- lexical-binding: t -*-

(add-to-list 'load-path
             (expand-file-name "lisp/" user-emacs-directory))

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package no-littering
  :ensure t
  :config
  (setq custom-file
        (no-littering-expand-etc-file-name "custom.el"))
  (load custom-file 'noerror)
  (setq backup-directory-alist
        `(("." . ,(no-littering-expand-var-file-name "backups/"))))
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(require 'do-settings)
(require 'do-project)
(require 'do-programming)
(require 'do-completion)
(require 'do-ui)
(require 'do-editor)
(require 'do-vc)
(require 'do-dired)
(require 'do-transient)
(require 'do-keybindings)
(require 'do-org)

;;; init.el ends here

;;; init.el --- My Emacs configuration -*- lexical-binding: t -*-

;;; Custom file
(setq custom-file
      (expand-file-name "custom.el"
                        user-emacs-directory))

(load custom-file 'noerror)

;;; Load path
(add-to-list 'load-path
             (expand-file-name "lisp/" user-emacs-directory))

;;; Package management
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

;;; Modules
(require 'do-settings)
(require 'do-project)
(require 'do-programming)
(require 'do-completion)
(require 'do-ui)
(require 'do-git)
(require 'do-dired)
(require 'do-transient)
(require 'do-keybindings)
(require 'do-org)

;;; init.el ends here

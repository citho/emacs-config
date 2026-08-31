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

(require 'use-package)

(setq use-package-always-ensure t)

;;; Modules
(require 'my-settings)
(require 'my-project)
(require 'my-programming)
(require 'my-completion)
(require 'my-git)
(require 'my-dired)
(require 'my-transient)
(require 'my-keybindings)

;;; init.el ends here

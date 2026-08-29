;;; my-keybindings.el --- Personal keybindings -*- lexical-binding: t -*-

(require 'my-transient)

;;; Language map
(defvar-keymap my-language-map
  :doc "Language commands."
  "r" #'eglot-rename
  "a" #'eglot-code-actions
  "f" #'apheleia-format-buffer)

;;; Search map
(defvar-keymap my-search-map
  :doc "Search commands."
  "l" #'consult-line
  "i" #'consult-imenu
  "r" #'consult-ripgrep)

;;; Leader map
(defvar-keymap my-leader-map
  :doc "Personal leader keymap."
  "b" #'consult-buffer
  "p" #'my-project-menu
  "e" #'my-emacs-menu
  "l" my-language-map
  "s" my-search-map)

(keymap-set global-map "C-c a" my-leader-map)

;;; Git workflow practice
(provide 'my-keybindings)

;;; Revert practice

;;; my-keybindings.el ends here

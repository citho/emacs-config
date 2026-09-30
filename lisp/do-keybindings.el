;;; do-keybindings.el --- Personal keybindings -*- lexical-binding: t -*-

(require 'do-transient)

(defvar-keymap my-language-map
  :doc "Language commands."
  "r" #'eglot-rename
  "a" #'eglot-code-actions
  "f" #'apheleia-format-buffer)

(defvar-keymap my-search-map
  :doc "Search commands."
  "i" #'consult-imenu
  "r" #'consult-ripgrep)

(defvar-keymap my-leader-map
  :doc "Personal leader keymap."
  "p" #'my-project-menu
  "e" #'my-emacs-menu
  "l" my-language-map
  "s" my-search-map)

(keymap-set global-map "C-c b" my-leader-map)

(provide 'do-keybindings)

;;; do-keybindings.el ends here

;;; my-programming.el --- Programming configuration -*- lexical-binding: t -*-

;;; Programming mode setup
(defun my-programming-mode-setup ()
  "Personal settings for programming buffers."
  (display-line-numbers-mode 1)
  (apheleia-mode 1))

(add-hook 'prog-mode-hook #'my-programming-mode-setup)

;;; Python
(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-ts-mode))

;;; Rust
(use-package rust-ts-mode
  :ensure nil
  :mode "\\.rs\\'")

;;; Javascript
(use-package js
  :ensure nil
  :mode ("\\.js\\'" . js-ts-mode))

;;; Typescript
(use-package typescript-ts-mode
  :ensure nil
  :mode ("\\.tsx?\\'" . typescript-ts-mode))

;;; C
(use-package c-ts-mode
  :ensure nil
  :mode "\\.c\\'")

;;; C++
(use-package c++-ts-mode
  :ensure nil
  :mode "\\.\\(?:cc\\|cpp\\|cxx\\)\\'")

;;; Java
(use-package java-ts-mode
  :ensure nil
  :mode "\\.java\\'")

;;; Eglot
(use-package eglot
  :ensure nil
  :hook
  (python-ts-mode . eglot-ensure)
  (rust-ts-mode . eglot-ensure)
  (js-ts-mode . eglot-ensure)
  (typescript-ts-mode . eglot-ensure)
  (c-ts-mode . eglot-ensure)
  (c++-ts-mode . eglot-ensure)
  (java-ts-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '((python-ts-mode)
                 "basedpyright-langserver" "--stdio"))
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode)
                 "rust-analyzer"))
  (add-to-list 'eglot-server-programs
               '((js-ts-mode typescript-ts-mode)
                 "typescript-language-server" "--stdio"))
  (add-to-list 'eglot-server-programs
               '((c-ts-mode c++-ts-mode)
                 "clangd"))
  (add-to-list 'eglot-server-programs
               '((java-ts-mode)
                 "jdtls")))

;;; Apheleia
(use-package apheleia
  :ensure t
  :config
  (setf (alist-get 'python-ts-mode apheleia-mode-alist)
        'ruff))

(provide 'my-programming)

;;; my-programming.el ends here

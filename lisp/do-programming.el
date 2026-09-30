;;; do-programming.el --- Programming configuration -*- lexical-binding: t -*-

(defun my-programming-mode-setup ()
  "Personal settings for programming buffers."
  (display-line-numbers-mode 1))

(add-hook 'prog-mode-hook #'my-programming-mode-setup)
(add-hook 'html-mode-hook #'my-programming-mode-setup)

(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-ts-mode))

(use-package rust-ts-mode
  :ensure nil
  :mode "\\.rs\\'")

(use-package js
  :ensure nil
  :mode ("\\.js\\'" . js-ts-mode))

(use-package typescript-ts-mode
  :ensure nil
  :mode ("\\.tsx?\\'" . typescript-ts-mode))

(use-package c-ts-mode
  :ensure nil
  :mode "\\.c\\'")

(use-package c++-ts-mode
  :ensure nil
  :mode "\\.\\(?:cc\\|cpp\\|cxx\\)\\'")

(use-package java-ts-mode
  :ensure nil
  :mode "\\.java\\'")

(use-package php-ts-mode
  :ensure nil
  :mode "\\.php\\'")

(use-package html-ts-mode
  :ensure nil
  :mode "\\.html?\\'")

(use-package css-ts-mode
  :ensure nil
  :mode "\\.css\\'")

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
  (php-ts-mode . eglot-ensure)
  (html-ts-mode . eglot-ensure)
  (css-ts-mode . eglot-ensure)
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
                 "jdtls"))
  (add-to-list 'eglot-server-programs
               '((php-ts-mode)
                 "intelephense" "--stdio"))
  (add-to-list 'eglot-server-programs
               '((html-ts-mode)
                 "vscode-html-language-server" "--stdio"))
  (add-to-list 'eglot-server-programs
               '((css-ts-mode)
                 "vscode-css-language-server" "--stdio")))

(use-package apheleia
  :ensure t
  :init
  (apheleia-global-mode +1)
  :config
  (setf (alist-get 'python-ts-mode apheleia-mode-alist)
        'ruff)
  (setf (alist-get 'php-ts-mode apheleia-mode-alist)
        'php-cs-fixer)
  (setf (alist-get 'php-cs-fixer apheleia-formatters)
        '("php-cs-fixer"
          "fix"
          "--using-cache=no"
          "--quiet"
          filepath)))

(provide 'do-programming)

;;; do-programming.el ends here

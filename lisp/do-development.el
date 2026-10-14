;;; do-development.el --- Programming tools -*- lexical-binding: t -*-

(defun my/prog-mode-setup ()
  "Configure whitespace behavior for programming buffers."
  (setq-local show-trailing-whitespace t)
  (add-hook 'before-save-hook
            #'delete-trailing-whitespace nil t))

(add-hook 'prog-mode-hook #'my/prog-mode-setup)

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
  (json-ts-mode . eglot-ensure)
  :init
  (with-eval-after-load 'eglot
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
                   "vscode-css-language-server" "--stdio"))
    (add-to-list 'eglot-server-programs
                 '((json-ts-mode)
                   "vscode-json-language-server" "--stdio")))
  :config
  (defun my/eglot-capf-setup ()
    "Configure completion sources for Eglot-managed buffers."
    (when (and (fboundp 'cape-capf-super)
               (fboundp 'cape-dabbrev))
      (setq-local completion-at-point-functions
                  (list
                   (cape-capf-super
                    #'eglot-completion-at-point
                    #'cape-dabbrev)))))
  (add-hook 'eglot-managed-mode-hook
            #'my/eglot-capf-setup))


(use-package apheleia
  :ensure t
  :init
  (add-hook 'after-init-hook
            (lambda ()
              (apheleia-global-mode 1)))
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

(provide 'do-development)

;;; do-development.el ends here

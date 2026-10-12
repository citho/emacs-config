;;; do-languages.el --- Language-specific configuration -*- lexical-binding: t -*-

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

(use-package json-ts-mode
  :ensure nil
  :mode "\\.json\\'")

(provide 'do-languages)

;;; do-languages.el ends here

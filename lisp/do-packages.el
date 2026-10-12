;;; do-packages.el --- Package bootstrap -*- lexical-binding: t -*-

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (require 'use-package nil 'noerror)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package))

(setq use-package-always-ensure t
      use-package-verbose nil)

(provide 'do-packages)

;;; do-packages.el ends here

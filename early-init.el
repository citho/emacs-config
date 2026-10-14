;;; early-init.el --- Early startup -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 128 1024 1024)
      gc-cons-percentage 0.6)

(setq package-enable-at-startup nil)

(defvar my/file-name-handler-alist
  file-name-handler-alist)

(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist
                  (delete-dups
                   (append my/file-name-handler-alist
                           file-name-handler-alist)))))

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message nil
      initial-scratch-message nil
      initial-major-mode 'fundamental-mode)

(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; early-init.el ends here

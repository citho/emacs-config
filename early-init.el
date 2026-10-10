;;; early-init.el --- Early startup configuration -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)
(setq inhibit-startup-message t
      initial-scratch-message nil)

(setq gc-cons-threshold (* 100 1024 1024))
(setq read-process-output-max (* 1024 1024))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; early-init.el ends here

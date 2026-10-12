;;; init.el --- Main entry point -*- lexical-binding: t -*-

(defconst my/init-start-time (current-time))

(defun my/report-startup-time ()
  "Report elapsed time and garbage collections."
  (message "Emacs ready in %.3fs | GC: %d"
           (float-time
            (time-subtract after-init-time
                           before-init-time))
           gcs-done))

(add-hook 'emacs-startup-hook #'my/report-startup-time)

(setq load-prefer-newer nil
      read-process-output-max (* 1024 1024)
      inhibit-compacting-font-caches t
      large-file-warning-threshold (* 100 1024 1024))

(when (and (fboundp 'native-comp-available-p)
           (native-comp-available-p))
  (setq native-comp-async-report-warnings-errors 'silent))

(add-to-list 'load-path
             (expand-file-name "lisp/" user-emacs-directory))

(require 'do-packages)
(require 'do-core)
(require 'do-completion)
(require 'do-ui)
(require 'do-editor)
(require 'do-tools)
(require 'do-development)
(require 'do-languages)
(require 'do-transient)
(require 'do-keybindings)
(require 'do-org)

;;; init.el ends here

;;; my-transient.el --- Personal transient menus -*- lexical-binding: t -*-

(require 'my-utils)
(require 'transient)

;;; Project
(transient-define-prefix my-project-menu ()
  "Project commands."
  [["Project"
    ("f" "Find file" project-find-file)
    ("b" "Switch buffer" project-switch-to-buffer)
    ("d" "Dired" project-dired)
    ("c" "Compile" project-compile)]

   ["Search"
    ("g" "Grep" project-find-regexp)]

   ["Other"
    ("p" "Switch project" project-switch-project)
    ("k" "Kill buffers" project-kill-buffers)]])

;;; Emacs
(transient-define-prefix my-emacs-menu ()
  "Emacs commands."
  [["Buffer"
    ("e" "Eval buffer" eval-buffer)
    ("m" "Messages" view-echo-area-messages)]

   ["Config"
    ("i" "Edit init" my-edit-init-file)
    ("r" "Reload init" my-reload-init)
    ("d" "Emacs directory" my-open-emacs-directory)]])

(provide 'my-transient)

;;; my-transient.el ends here

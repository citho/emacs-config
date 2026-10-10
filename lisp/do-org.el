;;; do-org.el --- Org configuration -*- lexical-binding: t -*-

(use-package org
  :ensure nil
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link))
  :config
  (setq org-agenda-files '("~/org/tasks.org"
                           "~/org/notes.org"
                           "~/org/schedule.org"
                           "~/org/meetings.org"
                           "~/org/journal.org"
                           "~/org/ideas.org"
                           "~/org/references.org"))
  (setq org-archive-location "~/org/archive.org::")
  (setq org-capture-templates
        '(("t" "Todo" entry
           (file+headline "~/org/tasks.org" "Tasks")
           "* TODO %?\n  %U\n")
          ("n" "Note" entry
           (file+headline "~/org/notes.org" "Notes")
           "* %?\n  %U\n")
          ("s" "Schedule" entry
           (file+headline "~/org/schedule.org" "Schedule")
           "* %?\n  SCHEDULED: %^t\n")
          ("m" "Meeting" entry
           (file+headline "~/org/meetings.org" "Meetings")
           "* %? :meeting:\n  %U\n")
          ("j" "Journal" entry
           (file+olp+datetree "~/org/journal.org")
           "* %?\n  %U\n")
          ("i" "Idea" entry
           (file+headline "~/org/ideas.org" "Ideas")
           "* %?\n  %U\n")
          ("r" "Reference" entry
           (file+headline "~/org/references.org" "References")
           "* %^{Title}\n  %U\n  %?\n")))
  (setq org-refile-targets
        '((nil :maxlevel . 3)
          (org-agenda-files :maxlevel . 3)))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "DOING(d)" "WAITING(w)" "|" "DONE(x)" "CANCELLED(c)")))
  (setq org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("DOING" . "orange")
          ("WAITING" . "yellow")
          ("DONE" . "green")
          ("CANCELLED" . "gray")))
  (setq org-log-done 'time
        org-log-into-drawer t)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (shell . t))))

(use-package org-roam
  :ensure t
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
  (setq org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :if-new
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("p" "project" plain
           "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
           :if-new
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
           :unnarrowed t)
          ("b" "book notes" plain
           "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
           :if-new
           (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)))
  :custom
  (org-roam-directory (file-truename "~/org/org-roam/")))

(provide 'do-org)

;;; do-org.el ends here

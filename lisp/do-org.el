;;; do-org.el --- Org productivity -*- lexical-binding: t -*-

(use-package org
  :ensure nil
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link))
  :config
  (setq org-directory "~/org/")
  (setq org-agenda-files '("~/org/inbox.org"
                           "~/org/notes.org"
                           "~/org/projects.org"
                           "~/org/journal.org"))
  (setq org-archive-location "~/org/archive.org::datetree/* Archived")
  (setq org-default-notes-file "~/org/inbox.org")
  (setq org-log-done 'time
        org-log-into-drawer t
        org-deadline-warning-days 7
        org-refile-targets
        '((nil :maxlevel . 4)
          (org-agenda-files :maxlevel . 4))
        org-outline-path-complete-in-steps nil
        org-refile-use-outline-path 'file
        org-clock-persist 'history
        org-clock-in-resume t
        org-clock-in-switch-to-state "DOING")
  (setq org-tag-alist
        '((:startgroup)
          ("work" . ?w)
          ("personal" . ?p)
          ("study" . ?s)
          ("project" . ?j)
          (:endgroup)
          ("urgent" . ?u)
          ("deepwork" . ?d)))
  (setq org-capture-templates
        '(("t" "Task" entry
           (file+headline "~/org/inbox.org" "Inbox")
           "* TODO %?\n  %U\n  %a\n")
          ("n" "Note" entry
           (file+headline "~/org/notes.org" "Quick Notes")
           "* %?\n  %U\n")
          ("p" "Project" entry
           (file+headline "~/org/projects.org" "Projects")
           "* TODO %^{Project name}\n  %U\n  %?")
          ("j" "Journal" entry
           (file+olp+datetree "~/org/journal.org" "Journal")
           "* %<%H:%M> %?\n  %U\n")
          ("l" "Link" entry
           (file+headline "~/org/notes.org" "References")
           "* %^{Title}\n  %U\n  %a\n  %?\n")
          ("s" "Scheduled task" entry
           (file+headline "~/org/inbox.org" "Inbox")
           "* TODO %^{Task}\n  SCHEDULED: %^t\n  %U\n  %?")
          ("m" "Meeting" entry
           (file+headline "~/org/inbox.org" "Meetings")
           "* %^{Meeting}\n  %^T\n** Notes\n%?\n** Action items\n")))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "DOING(d)" "WAITING(w)" "|"
                    "DONE(x)" "CANCELLED(c)")))
  (setq org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("DOING" . "orange")
          ("WAITING" . "yellow")
          ("DONE" . "green")
          ("CANCELLED" . "gray")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (shell . t)
     (sql . t))))

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

(use-package org-superstar
  :ensure t
  :defer t
  :hook (org-mode . org-superstar-mode))

(provide 'do-org)

;;; do-org.el ends here

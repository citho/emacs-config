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
  :custom
  (org-roam-directory (file-truename "~/org/roam/")
                      (org-roam-completion-everywhere t))
  (org-roam-node-display-template
   (concat "${title:*} "
           (propertize "${tags:10}" 'face 'org-tag)))
  :config
  (org-roam-db-autosync-mode 1)
  (setq org-roam-capture-templates
        '(("p" "Permanent note" plain
           "%?"
           :target (file+head
                    "permanent/${slug}.org"
                    "#+title: ${title}\n#+filetags: :permanent:\n#+created: %U\n\n* Main Idea\n\n* Explanation\n\n* Connections\n\n* References\n")
           :unnarrowed t)
          ("l" "Literature note" plain
           "%?"
           :target (file+head
                    "literature/${slug}.org"
                    "#+title: ${title}\n#+filetags: :literature:\n#+created: %U\n#+source: \n\n* Summary\n\n* Key Ideas\n\n* Quotes\n\n* My Thoughts\n")
           :unnarrowed t)
          ("f" "Fleeting note" plain
           "%?"
           :target (file+head
                    "fleeting/${slug}.org"
                    "#+title: ${title}\n#+filetags: :fleeting:\n#+created: %U\n\n* Note\n\n* Process\n")
           :unnarrowed t)
          ("r" "Reference / Web" plain
           "%?"
           :target (file+head
                    "references/${slug}.org"
                    "#+title: ${title}\n#+filetags: :reference:\n#+created: %U\n#+url: \n\n* Summary\n\n* Insights\n\n* Related Notes\n")
           :unnarrowed t)
          ("c" "Concept note" plain
           "%?"
           :target (file+head
                    "concepts/${slug}.org"
                    "#+title: ${title}\n#+filetags: :concept:\n#+created: %U\n\n* Definition\n\n* Why It Matters\n\n* Examples\n\n* Related Concepts\n")
           :unnarrowed t))))

(use-package org-roam-dailies
  :ensure nil
  :after (org-roam)
  :custom
  (org-roam-dailies-directory "daily/")
  :bind
  (("C-c n d" . org-roam-dailies-goto-today)
   ("C-c n D" . org-roam-dailies-capture-today)
   ("C-c n y" . org-roam-dailies-goto-yesterday)
   ("C-c n t" . org-roam-dailies-capture-date))
  :config
  (setq org-roam-dailies-capture-templates
        '(("d" "Daily" entry
           "* Daily Log\n\n%?\n\n"
           :target (file+head
                    "%<%Y-%m-%d>.org"
                    "#+title: %<%Y-%m-%d>\n#+filetags: :daily:\n\n")
           :unnarrowed t)
          ("j" "Journal" entry
           "* %<%H:%M> Journal\n\n%?\n"
           :target (file+head
                    "%<%Y-%m-%d>.org"
                    "#+title: %<%Y-%m-%d>\n\n")
           :unnarrowed t)
          ("t" "Task" entry
           "* TODO %?\n  SCHEDULED: %t\n"
           :target (file+head
                    "%<%Y-%m-%d>.org"
                    "#+title: %<%Y-%m-%d>\n\n")
           :unnarrowed t))))

(use-package org-roam-ui
  :ensure t
  :after (org-roam)
  :bind ("C-c n u" . org-roam-ui-open)
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t)
  (org-roam-ui-open-on-start nil))


(use-package org-superstar
  :ensure t
  :defer t
  :hook (org-mode . org-superstar-mode))

(provide 'do-org)

;;; do-org.el ends here

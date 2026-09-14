;;; my-org.el --- Personal configuration org -*- lexical-binding: t -*-

(use-package org
  :ensure nil
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :config
  (setq org-agenda-files '("~/org/tasks.org"))

  (setq org-capture-templates
        '(("t" "Task" entry
           (file+headline "~/org/tasks.org" "Tasks")
           "* TODO %?\n  %U\n")))
  
  (setq org-refile-targets
        '((nil :maxlevel . 3)))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "DOING(d)" "WAITING(w)" "|" "DONE(x)")))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

(provide 'my-org)

;;; my-settings.el ends here

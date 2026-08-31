;;; my-project.el --- Project configuration -*- lexical-binding: t -*-

(require 'project)

;;; Maven
(add-to-list 'project-vc-extra-root-markers "pom.xml")

(provide 'my-project)

;;; my-project.el ends here

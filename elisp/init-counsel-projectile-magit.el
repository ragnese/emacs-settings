;;; init-counsel-projectile-magit.el --- Initialize project + magit helper -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package counsel-projectile-magit
  :general
  (:prefix "SPC" :states 'normal "pp" #'counsel-projectile-switch-project-magit-status))

(provide 'init-counsel-projectile-magit)
;;; init-counsel-projectile-magit.el ends here

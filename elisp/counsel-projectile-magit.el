;;; counsel-projectile-magit.el --- Add a useful projectile function -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(require 'counsel-projectile)
(require 'magit)

(defun counsel-projectile-switch-project-magit-status ()
  "Switch to other project and open Magit status there."
  (interactive)
  (let ((counsel-projectile-switch-project-action #'magit-status))
    (call-interactively #'counsel-projectile-switch-project)))

(provide 'counsel-projectile-magit)
;;; counsel-projectile-magit.el ends here

;;; init-projectile.el --- Initializes my Projectile settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :diminish
  :defer nil
  :general
  (:prefix "SPC" :states 'normal "be" #'projectile-switch-to-buffer)
  (:prefix "SPC" :states 'normal "p" #'projectile-command-map)
  (:states 'normal "C-p" #'projectile-find-file)
  :config
  (projectile-mode 1))

(use-package counsel-projectile
  :after (projectile ivy)
  :ensure t
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)
;;; init-projectile.el ends here

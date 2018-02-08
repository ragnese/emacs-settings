;;; package --- Initializes my Projectile settings.
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode 1))

(use-package counsel-projectile
  :after (projectile ivy)
  :ensure t
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)
;;; init-projectile.el ends here

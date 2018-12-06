;;; init-projectile.el --- Initializes my Projectile settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :diminish
  :config
  (projectile-mode 1))

(use-package counsel-projectile
  :after (projectile ivy)
  :ensure t
  :config
  (counsel-projectile-mode))

(provide 'init-projectile)
;;; init-projectile.el ends here

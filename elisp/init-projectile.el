;;; package --- Initializes my Projectile settings.

;;; Commentary:

;;; Code:

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode 1)
  (when (fboundp 'evil-mode)
    (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)))

(provide 'init-projectile)
;;; init-projectile.el ends here

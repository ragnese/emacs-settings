;;; init-treemacs.el --- Initializes my treemacs settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package treemacs
  :ensure t
  :commands treemacs
  :general ("<f8>" #'treemacs)
  :config
  (setq treemacs-collapse-dirs              0
        treemacs-silent-refresh             t
        treemacs-is-never-other-window      t
        treemacs-no-png-images              t)

  (when (fboundp 'treemacs-git-mode)
    (treemacs-git-mode 'simple))
  (when (fboundp 'treemacs-follow-mode)
    (treemacs-follow-mode t))
  (when (fboundp 'treemacs-filewatch-mode)
    (treemacs-filewatch-mode t)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(provide 'init-treemacs)
;;; init-treemacs.el ends here

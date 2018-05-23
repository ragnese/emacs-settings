;;; package --- Initializes my treemacs settings.
;;; Commentary:
;;; Code:
(use-package treemacs
  :ensure t
  :defer t
  :config
  (setq treemacs-follow-after-init          t
        treemacs-width                      35
        treemacs-indentation                2
        treemacs-git-mode                   'simple
        treemacs-collapse-dirs              0
        treemacs-silent-refresh             t
        treemacs-change-root-without-asking nil
        treemacs-sorting                    'alphabetic-desc
        treemacs-show-hidden-files          t
        treemacs-never-persist              nil
        treemacs-is-never-other-window      t
        treemacs-goto-tag-strategy          'refetch-index
        treemacs-no-png-images              t)

  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))


(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t
  :demand t)


(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))

(provide 'init-treemacs)
;;; init-treemacs.el ends here

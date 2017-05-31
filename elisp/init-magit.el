;;; package --- Initializes my magit settings.

;;; Commentary:

;;; Code:
(use-package magit
  :ensure t
  :defer t
  :diminish auto-revert-mode
  :config
  (use-package evil-magit
    :ensure t))

(provide 'init-magit)
;;; init-magit.el ends here


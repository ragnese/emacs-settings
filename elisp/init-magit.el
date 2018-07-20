;;; package --- Initializes my magit settings.
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :defer t
  :diminish auto-revert-mode
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(provide 'init-magit)
;;; init-magit.el ends here

;;; package --- Initializes my magit settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :defer t
  :diminish auto-revert-mode
  :config
  (when (fboundp 'magit-display-buffer-fullframe-status-v1)
    (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)))

(provide 'init-magit)
;;; init-magit.el ends here

;;; package --- Initializes my magit settings.

;;; Commentary:

;;; Code:
(use-package magit
  :ensure t
  :defer t
  :diminish auto-revert-mode
  :config
  (use-package evil-magit
    :ensure t)
  (when (fboundp 'evil-mode)
    (evil-ex-define-cmd "git" 'magit-status)))

(provide 'init-magit)
;;; init-magit.el ends here


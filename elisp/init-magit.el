;;; init-magit.el --- Initializes my magit settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :diminish auto-revert-mode
  :commands magit-status
  :init
  (with-eval-after-load 'evil-ex
    (when (fboundp 'evil-ex-define-cmd)
      (evil-ex-define-cmd "git" #'magit-status)))
  :config
  (when (fboundp 'magit-display-buffer-fullframe-status-v1)
    (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)))

(provide 'init-magit)
;;; init-magit.el ends here

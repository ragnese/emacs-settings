;;; init-magit.el --- Initializes my magit settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :diminish auto-revert-mode
  :commands magit-status
  :general ('magit-status-mode-map "SPC" nil)
  :init
  (with-eval-after-load 'evil-ex
    (when (fboundp 'evil-ex-define-cmd)
      (evil-ex-define-cmd "git" #'magit-status)))
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
  :config
  (when (fboundp 'magit-display-buffer-same-window-except-diff-v1)
    (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)))

(provide 'init-magit)
;;; init-magit.el ends here

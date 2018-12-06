;;; init-which-key.el --- Initializes my which-key settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode)
  (setq which-key-allow-evil-operators t)
  (setq which-key-show-operator-state-maps t))

(provide 'init-which-key)
;;; init-which-key.el ends here

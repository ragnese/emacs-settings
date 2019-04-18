;;; init-theme.el --- Initializes my theme settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Color scheme
(use-package monokai-theme
  :ensure t
  :config
  (setq monokai-background "#161A1F")
  (setq monokai-comments "#8C8C8C")
  (load-theme 'monokai t))

(use-package doom-themes
  :disabled
  :ensure t
  :config
  (load-theme 'doom-molokai t))

(provide 'init-theme)
;;; init-theme ends here

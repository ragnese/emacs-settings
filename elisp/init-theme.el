;;; package --- Initializes my theme settings.
;;; Commentary:
;;; Code:

;; Color scheme
(use-package monokai-theme
  :ensure t
  :config
  (setq monokai-background "#161A1F")
  (setq monokai-comments "#8C8C8C")
  (load-theme 'monokai t))

(provide 'init-theme)
;;; init-theme ends here

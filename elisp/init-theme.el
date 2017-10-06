;;; package --- Initializes my theme settings.

;;; Commentary:

;;; Code:

;; Color scheme
(use-package monokai-theme
  :ensure t
  :config
  (setq monokai-background "#1B1D1E")
  (load-theme 'monokai t))

(provide 'init-theme)
;;; init-theme ends here

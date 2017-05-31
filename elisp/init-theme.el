;;; package --- Initializes my theme settings.

;;; Commentary:

;;; Code:

;; Color scheme
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

(provide 'init-theme)
;;; init-theme ends here

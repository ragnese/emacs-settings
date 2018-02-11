;;; package --- Initializes my Geiser settings.
;;; Commentary:
;;; Code:
(use-package geiser
  :init
  (setq geiser-active-implementations '(racket guile))
  :ensure t)

(provide 'init-geiser)
;;; init-geiser.el ends here

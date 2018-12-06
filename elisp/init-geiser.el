;;; init-geiser.el --- Initializes my Geiser settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package geiser
  :mode "\\.scm\\'"
  :init
  (defvar geiser-active-implementations)
  (setq geiser-active-implementations '(racket guile))
  :ensure t)

(provide 'init-geiser)
;;; init-geiser.el ends here

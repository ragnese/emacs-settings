;;; init-ibuffer.el --- Initializes my ibuffer settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package ibuffer-projectile
  :after projectile
  :ensure t
  :hook (ibuffer . ibuffer-projectile-set-filter-groups))

(provide 'init-ibuffer)
;;; init-ibuffer ends here

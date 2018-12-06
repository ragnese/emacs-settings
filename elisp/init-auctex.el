;;; init-auctex.el --- Initializes my Auctex settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package tex
  :ensure auctex
  :mode ("\\.[la]tex\\'" . tex-mode)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))

(provide 'init-auctex)
;;; init-auctex.el ends here

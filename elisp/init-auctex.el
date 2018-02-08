;;; package --- Initializes my Auctex settings.
;;; Commentary:
;;; Code:
(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))

(provide 'init-auctex)
;;; init-auctex.el ends here

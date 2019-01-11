;;; init-ibuffer.el --- Initializes my ibuffer settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package ibuffer-vc
  :ensure t
  :hook (ibuffer . ibuffer-vc-set-filter-groups-by-vc-root)
  :config
  (setq ibuffer-formats
        '((mark modified read-only vc-status-mini " "
                (name 18 18 :left :elide)
                " "
                (mode 16 16 :left :elide)
                " "
                (vc-status 16 16 :left)
                " "
                filename-and-process))))

(provide 'init-ibuffer)
;;; init-ibuffer ends here

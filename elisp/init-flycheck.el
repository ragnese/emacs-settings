;;; package --- Initializes my flycheck settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Syntax checking
;;; Code:
(use-package flycheck
  :ensure t
  :hook (prog-mode . global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here

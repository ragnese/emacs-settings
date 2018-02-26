;;; package --- Initializes my flycheck settings.
;;; Commentary: Syntax checking
;;; Code:
(use-package flycheck
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here

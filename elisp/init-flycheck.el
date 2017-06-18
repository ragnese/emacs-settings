;;; package --- Initializes my flycheck settings.

;;; Commentary:

;;; Code:
;; Flycheck for syntax checking
(use-package flycheck
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook 'global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
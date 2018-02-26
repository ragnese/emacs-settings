;;; package --- Initializes my Language Server settings.

;;; Commentary:

;;; Code:
(use-package lsp-mode
  :diminish
  :ensure t
  :config
  (setq lsp-response-timeout 25))

(use-package lsp-ui
  :ensure t
  :disabled
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-flycheck
  :ensure f ; comes with lsp-mode
  :after (lsp-mode flycheck))

(use-package company-lsp
  :ensure t
  :after (lsp-mode company)
  :config
  (push 'company-lsp company-backends))

(provide 'init-lsp)
;;; init-lsp.el ends here

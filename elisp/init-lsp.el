;;; init-lsp.el --- Initializes my Language Server settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package lsp-mode
  :ensure t
  :defer t
  :diminish
  :config
  (setq lsp-response-timeout 25))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . (lambda ()
                      (when (fboundp 'lsp-ui-flycheck-enable)
                        (lsp-ui-flycheck-enable 1)))))

(use-package company-lsp
  :ensure t
  :after (lsp-mode company)
  :config
  (push 'company-lsp company-backends))

(provide 'init-lsp)
;;; init-lsp.el ends here

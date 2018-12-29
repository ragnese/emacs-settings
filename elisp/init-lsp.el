;;; init-lsp.el --- Initializes my Language Server settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package lsp-mode
  :ensure t
  :hook ((rust-mode) . #'lsp)
  :diminish
  :config
  (setq
   lsp-response-timeout 25
   lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode
  :init (when (fboundp 'lsp-ui-flycheck-enable)
          (lsp-ui-flycheck-enable 1)))

(use-package company-lsp
  :ensure t
  :after (lsp-mode company)
  :commands company-lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here

;;; init-lsp.el --- Initializes my Language Server settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :after lsp-mode
  :config
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))

(use-package company-lsp
  :ensure t
  :after (lsp-mode company)
  :commands company-lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here

;;; init-swift.el --- Initializes my Swift settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package swift-mode
  :ensure t
  :mode "\\.swift\\'")

(use-package flycheck-swift
  :after (flycheck swift-mode)
  :hook (flycheck-mode . flycheck-swift-setup)
  :ensure t)

(provide 'init-swift)
;;; init-swift.el ends here

;;; package --- Initializes my Swift settings.
;;; Commentary:
;;; Code:
(use-package swift-mode
  :ensure t)

(use-package flycheck-swift
  :after (flycheck swift-mode)
  :ensure t
  :config
  (eval-after-load 'flycheck '(flycheck-swift-setup))
  (setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk")
  (setq flycheck-swift-target "arm64-apple-ios11"))

(use-package company-sourcekit
  :after (swift-mode)
  :ensure t
  :config
  (add-to-list 'company-backends 'company-sourcekit))

(provide 'init-swift)
;;; init-swift.el ends here

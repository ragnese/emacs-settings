;;; package --- Initializes my Python settings.
;;; Commentary:
;;; Code:
;(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(use-package elpy
  :ensure t
  :init (add-hook 'python-mode-hook #'elpy-enable))

(provide 'init-python)
;;; init-python.el ends here

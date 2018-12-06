;;; init-python.el --- Initializes my Python settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package elpy
  :ensure t
  :mode "\\.py\\'"
  :hook (python-mode . elpy-enable))

(provide 'init-python)
;;; init-python.el ends here

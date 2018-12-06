;;; package --- Initializes my Python settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package elpy
  :ensure t
  :hook (python-mode . elpy-enable))

(provide 'init-python)
;;; init-python.el ends here

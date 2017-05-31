;;; package --- Initializes my nlinum settings.

;;; Commentary:

;;; Code:

;; Faster version of built-in linum mode
(use-package nlinum
  :ensure t
  :config
  (global-nlinum-mode))

(provide 'init-nlinum)
;;; init-nlinum ends here

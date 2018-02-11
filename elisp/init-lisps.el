;;; package --- Initializes my settings for all lisps.

;;; Commentary:

;;; Code:
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
  :ensure t
  :diminish
  :config
  (add-hook 'lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'scheme-mode-hook #'smartparens-strict-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode))

(provide 'init-lisps)
;;; init-lisps.el ends here

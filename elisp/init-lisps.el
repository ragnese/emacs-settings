;;; package --- Initializes my settings for all lisps.

;;; Commentary:

;;; Code:
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'scheme-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
  :ensure t
  :diminish
  :config
  (let ((modes (list #'list-mode
                     #'scheme-mode
                     #'emacs-lisp-mode
                     #'clojure-mode)))
    (dolist (mode modes)
      (add-hook (intern (concat (symbol-name mode) "-hook"))
                #'smartparens-strict-mode)
      (sp-local-pair mode "'" nil :actions nil))))

(provide 'init-lisps)
;;; init-lisps.el ends here

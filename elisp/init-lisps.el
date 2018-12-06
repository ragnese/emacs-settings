;;; package --- Initializes my settings for all lisps. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package rainbow-delimiters
  :ensure t
  :hook ((scheme-mode
          lisp-mode
          emacs-lisp-mode
          clojure-mode
          common-lisp-mode) . rainbow-delimiters-mode))

(use-package smartparens
  :ensure t
  :diminish
  :config
  (let ((modes (list #'lisp-mode
                     #'scheme-mode
                     #'emacs-lisp-mode
                     #'clojure-mode
                     #'common-lisp-mode)))
    (dolist (mode modes)
      (add-hook (intern (concat (symbol-name mode) "-hook"))
                #'smartparens-strict-mode)
      (when (fboundp 'sp-local-pair)
        (sp-local-pair mode "'" nil :actions nil)))))

(provide 'init-lisps)
;;; init-lisps.el ends here

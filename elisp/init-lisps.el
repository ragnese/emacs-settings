;;; init-lisps.el --- Initializes my settings for all lisps. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package rainbow-delimiters
  :ensure t
  :hook ((scheme-mode
          lisp-mode
          emacs-lisp-mode
          clojure-mode
          common-lisp-mode) . rainbow-delimiters-mode))

(provide 'init-lisps)
;;; init-lisps.el ends here

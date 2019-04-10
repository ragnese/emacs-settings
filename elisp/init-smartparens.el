;;; init-smartparens.el --- Initializes my settings for all smartparens. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package smartparens
  :ensure t
  :diminish
  :hook (((scheme-mode
           lisp-mode
           emacs-lisp-mode
           clojure-mode
           common-lisp-mode) . smartparens-strict-mode))
  :general
  (:states 'normal
           :keymaps 'smartparens-mode-map
           ">" #'sp-forward-slurp-sexp
           "M->" #'sp-forward-barf-sexp
           "<" #'sp-backward-slurp-sexp
           "M-<" #'sp-backward-barf-sexp)
  :config
  (require 'smartparens-config))

(provide 'init-smartparens)
;;; init-smartparens.el ends here

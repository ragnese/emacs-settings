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
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (general-define-key :states 'normal
                      ">" #'sp-slurp-hybrid-sexp)
  ; Override for lisps
  (general-define-key :states 'normal
                      :keymaps '(scheme-mode-map
                                 lisp-mode-map
                                 emacs-lisp-mode-map
                                 clojure-mode-map
                                 common-lisp-mode-map)
                      ">" #'sp-forward-slurp-sexp
                      "M->" #'sp-forward-barf-sexp
                      "<" #'sp-backward-slurp-sexp
                      "M-<" #'sp-backward-barf-sexp))

(provide 'init-smartparens)
;;; init-smartparens.el ends here

;;; init-lisps.el --- Initializes my settings for all lisps. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package rainbow-delimiters
  :ensure t
  :hook ((scheme-mode lisp-mode emacs-lisp-mode clojure-mode common-lisp-mode) . rainbow-delimiters-mode))

(use-package smartparens
  :ensure t
  :diminish
  :general
  ("C-<right>" #'sp-forward-slurp-sexp
   "M-<right>" #'sp-forward-barf-sexp
   "C-<left>" #'sp-backward-slurp-sexp
   "M-<left>" #'sp-backward-barf-sexp)
  :hook ((scheme-mode lisp-mode emacs-lisp-mode clojure-mode common-lisp-mode) . smartparens-strict-mode)
  :config
  (when (fboundp 'sp-local-pair)
    (sp-local-pair '(scheme-mode
                     lisp-mode
                     emacs-lisp-mode
                     clojure-mode
                     common-lisp-mode) "'" nil :actions nil)))

(provide 'init-lisps)
;;; init-lisps.el ends here

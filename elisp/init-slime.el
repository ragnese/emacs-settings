;;; init-slime.el --- Initializes my Common Lisp settings
;;; Commentary:
;;; Code:
(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(provide 'init-slime)
;;; init-slime ends here

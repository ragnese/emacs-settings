;;; init-cl.el --- Initializes my settings for Common Lisp -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package slime
  :ensure t
  :defines (inferior-lisp-program slime-contribs)
  :commands slime
  :config
  (setq inferior-lisp-program "sbcl")
  (setq slime-contribs '(slime-fancy)))

(provide 'init-cl)
;;; init-cl.el ends here

;;; package --- Initializes my Org mode settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (scheme . t)
   (python . t)
   (shell . t)))

(provide 'init-org)
;;; init-org.el ends here

;;; init-org.el --- Initializes my Org mode settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package org
  :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-hierarchical-todo-statistics nil)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (scheme . t)
     (python . t)
     (shell . t))))

(provide 'init-org)
;;; init-org.el ends here

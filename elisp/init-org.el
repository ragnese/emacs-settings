;;; package --- Initializes my Org mode settings.

;;; Commentary:

;;; Code:

(org-babel-do-load-languages
 'org-babel-load-languages
 '((scheme . t)
   (python . t)
   (sh . t)))

(setq org-src-fontify-natively t)

(provide 'init-org)
;;; init-org.el ends here

;;; package --- Initializes my column-enforce-mode settings.

;;; Commentary:

;;; Code:
;; Highlight or otherwise annoy us when lines are too long
(use-package column-enforce-mode
  :ensure t
  :defer t
  :diminish column-enforce-mode)

(provide 'init-column-enforce-mode)
;;; init-column-enforce-mode.el ends here

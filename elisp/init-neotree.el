;;; package --- Initializes my neotree settings.

;;; Commentary:

;;; Code:
;; File tree
(use-package neotree
  :ensure t
  :defer t
  :config
  (when (fboundp #'nlinum-mode)
  (add-hook 'neotree-mode-hook (lambda ()
				 "Turn off line numbers in neotree mode"
				 (nlinum-mode -1)))))

(provide 'init-neotree)
;;; init-neotree.el ends here

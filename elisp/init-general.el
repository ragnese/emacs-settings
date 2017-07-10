;;; package --- Initializes my General settings.

;;; Commentary:

;;; Code:

(use-package general
  :ensure t
  :config
  (setq general-default-keymaps 'evil-normal-state-map)
  (let ((my-leader "SPC"))
   (general-define-key :prefix my-leader
		       "SPC" #'evil-search-highlight-persist-remove-all)
   (general-define-key :prefix my-leader
		       "p" #'projectile-switch-project)))

(provide 'init-general)
;;; init-general ends here

;;; package --- Initializes my nlinum settings.

;;; Commentary:

;;; Code:

;; Useful function to turn off line numbers in multiple modes
(defun my-add-multi-hook (func hooks)
  "Apply FUNC to multiple HOOKS."
  (mapc (lambda (hook)
	  (add-hook hook func))
	hooks))

;; Faster version of built-in linum mode
(use-package nlinum
  :ensure t
  :config
  (global-nlinum-mode)
  (my-add-multi-hook (lambda ()
		       "Turn off line numbers"
		       (nlinum-mode -1))
		     '(term-mode-hook
		       dired-mode-hook)))

(provide 'init-nlinum)
;;; init-nlinum ends here

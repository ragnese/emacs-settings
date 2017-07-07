;;; package --- Initializes my Company settings.

;;; Commentary:

;;; Code:

;; Company mode for completions
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'prog-mode-hook 'global-company-mode)
  ;; Reduce the time after which the company auto completion popup opens
  (setq company-idle-delay 0.5)
  ;; Reduce the number of characters before company kicks in
  (setq company-minimum-prefix-length 1)
  ;; Makes the popup window have nicer formatting
  (setq company-tooltip-align-annotations t))
  ;; Nicer keybindings for navigating completions
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)

(provide 'init-company)
;;; init-company.el ends here

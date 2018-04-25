;;; package --- Initializes my Company settings.
;;; Commentary:
;;; Code:
;; Company mode for completions
(use-package company
  :ensure t
  :diminish company-mode
  :hook (prog-mode . global-company-mode)
  :config
  ;; Reduce the time after which the company auto completion popup opens
  (setq company-idle-delay 0.3)
  ;; Reduce the number of characters before company kicks in
  (setq company-minimum-prefix-length 1)
  ;; Makes the popup window have nicer formatting
  (setq company-tooltip-align-annotations t))

(provide 'init-company)
;;; init-company.el ends here

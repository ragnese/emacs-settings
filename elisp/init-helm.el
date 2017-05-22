;;; package --- Initializes my Helm settings.

;;; Commentary:

;;; Code:

(use-package helm
  :ensure t
  :config
  ;;(helm-mode 1)
  (define-key evil-ex-map "b" 'helm-mini)
  (define-key evil-ex-map "e" 'helm-find-files))

(provide 'init-helm)
;;; init-helm ends here

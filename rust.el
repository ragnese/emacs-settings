(use-package rust-mode
  :ensure t)

(use-package racer
  :ensure t
  :config
  (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer")))

(use-package flycheck-rust
  :ensure t)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)

;;; package --- Initializes my Rust settings.

;;; Commentary:

;;; Code:
(use-package rust-mode
  :ensure t
  :config
  (setq rust-rustfmt-bin "~/.cargo/bin/rustfmt")
  (when (fboundp 'column-enforce-mode)
    (setq column-enforce-column 100)
    (add-hook 'rust-mode-hook 'column-enforce-mode)))

(use-package racer
  :ensure t
  :diminish racer-mode
  :config
  (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (when (fboundp 'company-mode)
    (add-hook 'racer-mode-hook #'company-mode)))

(when (fboundp 'flycheck-mode)
  (use-package flycheck-rust
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust)
;;; init-rust.el ends here

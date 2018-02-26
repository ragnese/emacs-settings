;;; package --- Initializes my Rust settings.

;;; Commentary:

;;; Code:
(use-package rust-mode
  :ensure t
  :config
  (setq rust-rustfmt-bin (concat (getenv "HOME") "/.cargo/bin/rustfmt"))
  (when (fboundp 'column-enforce-mode)
    (setq column-enforce-column 100)
    (add-hook 'rust-mode-hook #'column-enforce-mode)))

(use-package lsp-rust
  :ensure t
  :after lsp-mode)

(use-package cargo
  :ensure t
  :diminish cargo-minor-mode
  :config
  (add-hook 'rust-mode-hook #'cargo-minor-mode))

(use-package toml-mode
  :ensure t)

(provide 'init-rust2)
;;; init-rust2.el ends here

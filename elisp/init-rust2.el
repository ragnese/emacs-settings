;;; package --- Initializes my Rust settings.

;;; Commentary:

;;; Code:
(use-package rust-mode
  :ensure t
  :config
  (setq rust-format-on-save t))

(use-package lsp-rust
  :requires (rust-mode lsp-mode lsp-ui)
  :ensure t
  :hook ((rust-mode . lsp-rust-enable)
         (rust-mode . flycheck-mode)))

(use-package cargo
  :ensure t
  :diminish cargo-minor-mode
  :hook (rust-mode . cargo-minor-mode))

(use-package toml-mode
  :ensure t)

(provide 'init-rust2)
;;; init-rust2.el ends here

;;; init-rust2.el --- Initializes my Rust settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t))

(use-package flycheck-rust
  :ensure t
  :after (flycheck rust-mode)
  :hook (flycheck-mode . flycheck-rust-setup))

(use-package cargo
  :ensure t
  :diminish cargo-minor-mode
  :hook (rust-mode . cargo-minor-mode))

(use-package toml-mode
  :ensure t
  :mode "\\.toml\\'")

(provide 'init-rust2)
;;; init-rust2.el ends here

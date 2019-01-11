;;; init-rust.el --- Initializes my Rust settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package rust-mode
  :ensure t
  :init
  :mode "\\.rs\\'"
  :hook (rust-mode . (lambda ()
                       (when (fboundp #'lsp)
                         (lsp))))
  :config
  (setq rust-format-on-save t))

(use-package cargo
  :ensure t
  :diminish cargo-minor-mode
  :hook ((rust-mode toml-mode) . cargo-minor-mode))

(use-package toml-mode
  :ensure t
  :mode "\\.toml\\'")

(provide 'init-rust)
;;; init-rust.el ends here

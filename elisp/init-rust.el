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

(use-package racer
  :ensure t
  :diminish racer-mode
  :config
  (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (when (fboundp 'company-mode)
    (add-hook 'racer-mode-hook #'company-mode))
  (when (eq window-system 'ns)
    (setq racer-rust-src-path (concat (getenv "HOME") "/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"))))


(when (fboundp 'flycheck-mode)
  (use-package flycheck-rust
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package cargo
  :ensure t
  :diminish cargo-minor-mode
  :config
  (add-hook 'rust-mode-hook #'cargo-minor-mode))

(use-package toml-mode
  :ensure t)

(provide 'init-rust)
;;; init-rust.el ends here

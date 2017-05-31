;;; package --- Initializes my Rust settings.

;;; Commentary:

;;; Code:
(use-package rust-mode
  :ensure t
  :config
  (setq rust-rustfmt-bin "~/.cargo/bin/rustfmt")
  (setq column-enforce-column 100)
  (add-hook 'rust-mode-hook 'column-enforce-mode))

(use-package racer
  :ensure t
  :diminish racer-mode
  :config
  (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
  (require 'evil)
  (evil-define-key 'normal rust-mode-map (kbd "gd") #'racer-find-definition)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))


(use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(diminish 'eldoc-mode)

(provide 'init-rust)
;;; init-rust.el ends here

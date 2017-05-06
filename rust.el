(require-package 'rust-mode)
(require 'rust-mode)

(require-package 'racer)
(require 'racer)

(require-package 'flycheck-rust)
(require 'flycheck-rust)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

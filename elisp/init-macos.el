;;; init-macos.el --- Initializes my macOS-specific settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
;; Make sure Emacs's PATH matches shell's on macOS
(use-package exec-path-from-shell
  :if (eq window-system 'ns)
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(provide 'init-macos)
;;; init-macos.el ends here

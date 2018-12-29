;;; init-macos.el --- Initializes my macOS-specific settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(when (eq window-system 'ns)
  (setq mac-option-modifier 'super
        mac-command-modifier 'meta))

(provide 'init-macos)
;;; init-macos.el ends here

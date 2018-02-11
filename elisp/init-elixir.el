;;; package --- Initializes my Elixir settings.
;;; Commentary:
;;; Code:
(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :after elixir-mode
  :ensure t)

(provide 'init-elixir)
;;; init-elixir.el ends here

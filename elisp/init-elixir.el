;;; init-elixir.el --- Initializes my Elixir settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package elixir-mode
  :mode ("\\.ex[s]\\'" "\\.elixir[2]\\'")
  :ensure t)

(use-package alchemist
  :after elixir-mode
  :ensure t)

(provide 'init-elixir)
;;; init-elixir.el ends here

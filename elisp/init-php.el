;;; init-php.el --- Initializes my PHP settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package php-mode
  :mode "\\.php\\'"
  :ensure t)

(use-package lsp-php
  :after php-mode
  :ensure t
  :hook (php-mode . lsp-php-enable)
  :config
  (setq lsp-php-server-install-dir "/home/rob/.local/opt/php-language-server/"))

(use-package phpcbf
  :after php-mode
  :ensure t
  :hook (php-mode . phpcbf-enable-on-save)
  :config
  (custom-set-variables
   '(phpcbf-executable "~/.config/composer/vendor/bin/phpcbf")
   '(phpcbf-standard "PSR2")))

(provide 'init-php)
;;; init-php.el ends here

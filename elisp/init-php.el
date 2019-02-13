;;; init-php.el --- Initializes my PHP settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package php-mode
  :ensure t
  :mode "\\.php\\'"
  :hook ((php-mode . php-enable-psr2-coding-style)
         (php-mode . (lambda ()
                        (when (fboundp #'lsp)
                          (lsp))))))

(provide 'init-php)
;;; init-php.el ends here

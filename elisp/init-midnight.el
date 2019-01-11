;;; init-midnight.el --- Initializes my Midnight settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package midnight
  :ensure nil
  :init (setq clean-buffer-list-delay-general nil
              midnight-period 3600)
  :config (midnight-delay-set 'midnight-delay 0))

(provide 'init-midnight)
;;; init-midnight.el ends here

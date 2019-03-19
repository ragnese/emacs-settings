;;; init-occur.el --- Initializes my Occur settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package occur
  :ensure nil
  :general (:prefix "SPC" :states 'normal "o" #'occur)
  :hook (occur . (lambda () (pop-to-buffer "*Occur*"))))

(provide 'init-occur)
;;; init-occur.el ends here

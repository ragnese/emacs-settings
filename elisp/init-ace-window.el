;;; init-ace-window.el --- Initializes my Ace Window settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package ace-window
  :ensure t
  :general (:prefix "SPC" :states 'normal "w w" #'ace-window))

(provide 'init-ace-window)
;;; init-ace-window.el ends here

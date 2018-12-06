;;; init-ivy.el --- Initializes my Ivy settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package ivy
  :ensure t
  :diminish
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (diminish 'counsel-mode)

  ;; Do not show "./" and "../" in the `counsel-find-file' completion list
  ;; default value: ("../" "./")
  (setq ivy-extra-directories nil))

(provide 'init-ivy)
;;; init-ivy.el ends here

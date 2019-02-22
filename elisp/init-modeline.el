;;; init-modeline.el --- Initializes my modeline settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package nyan-mode
  :ensure t)

(setq-default mode-line-format
              '(""
                mode-line-front-space
                ;mode-line-mule-info
                ;mode-line-client
                ;mode-line-modified
                ;mode-line-remote
                ;mode-line-frame-identification
                mode-line-buffer-identification
                "   "
                ;evil-mode-line-tag
                ;(vc-mode vc-mode)
                mode-line-modes
                ;mode-line-misc-info
                "   "
                mode-line-position
                "   "
                (:eval (list (nyan-create)))
                "   "
                mode-line-end-spaces))

(provide 'init-modeline)
;;; init-modeline.el ends here

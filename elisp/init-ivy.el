;;; package --- Initializes my Ivy settings.
;;; Commentary:
;;; Code:
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (diminish 'counsel-mode)

  ;; Do not show "./" and "../" in the `counsel-find-file' completion list
  (setq ivy-extra-directories nil) ; default value: ("../" "./")

  ;; Let ESC quite the ivy minibuffer.
  (require 'custom-functions)
  (define-key counsel-mode-map [escape] #'minibuffer-keyboard-quit)

  ;; Function kills buffer in ivy buffer list
  (defun local/ivy-kill-buffer ()
    (interactive)
    "Function kills buffer in ivy buffer list."
    (ivy-set-action 'kill-buffer)
    (ivy-done))

  ;; Use C-k to kill buffer in ivy buffer list
  (bind-keys
   :map ivy-switch-buffer-map
   ("C-k" . local/ivy-kill-buffer)))

(provide 'init-ivy)
;;; init-ivy.el ends here

;;; package --- Initializes my Projectile settings.

;;; Commentary:

;;; Code:

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init
  (require 'init-evil)
  :config
  (projectile-mode 1)
  (evil-define-key 'normal prog-mode-map (kbd "C-p") 'projectile-find-file)
  (evil-define-key 'insert prog-mode-map (kbd "C-p") 'projectile-find-file)
  (evil-define-key 'replace prog-mode-map (kbd "C-p") 'projectile-find-file)
  (evil-define-key 'visual prog-mode-map (kbd "C-p") 'projectile-find-file)
  (evil-define-key 'emacs prog-mode-map (kbd "C-p") 'projectile-find-file))

(provide 'init-projectile)
;;; init-projectile.el ends here

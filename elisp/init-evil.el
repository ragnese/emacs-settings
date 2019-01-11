;;; init-evil.el --- Initializes my Evil settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Vim all the things!
;;; Code:
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  :ensure t
  :config
  (evil-mode 1)

  (when (and (fboundp 'evil-define-command)
             (fboundp 'evil-prev-buffer)
             (fboundp 'evil-delete-buffer)
             (fboundp 'evil-ex-define-cmd)
             (fboundp 'evil-set-command-properties))
    ;; Add command to delete buffer without closing split
    (evil-define-command delete-buffer-preserve-split ()
      "Deletes the current buffer, like :bd, but doesn't close the split"
      (let ((prev-buffer (current-buffer)))
        (evil-prev-buffer)
        (evil-delete-buffer prev-buffer)))

    (evil-ex-define-cmd "Bd" 'delete-buffer-preserve-split)))

;; Diminish the mode-line for undo-tree, which is a dep of evil-mode
(use-package undo-tree
  :ensure nil
  :diminish)

;; Add Vim bindings to many modes
(use-package evil-collection
  :after evil
  :ensure t
  :custom (evil-collection-company-use-tng nil)
  :config (evil-collection-init))

;; Add evil-magit
(use-package evil-magit
  :after (evil magit)
  :ensure t)

;; Add evil-smartparens if smartparens is installed
(use-package evil-smartparens
  :after (evil smartparens)
  :ensure t
  :diminish
  :hook (smartparens-enabled . evil-smartparens-mode))

;; Vim-like search highlighting
(use-package evil-search-highlight-persist
  :ensure t
  :config (global-evil-search-highlight-persist t))

(provide 'init-evil)
;;; init-evil ends here

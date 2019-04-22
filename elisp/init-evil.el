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
  :defer nil
  :general
  (:prefix "SPC" :states 'normal "w" #'evil-window-map)
  (:keymaps 'global-map "M-u" #'universal-argument)
  (:keymaps 'universal-argument-map "M-u" #'universal-argument-more)
  :config
  (evil-mode 1)

  (modify-syntax-entry ?_ "w")

  ;; Don't show state in the modeline
  (setq evil-mode-line-format 'nil)

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
  :config (evil-collection-init '(dired)))

;; Add evil-magit
(use-package evil-magit
  :after (evil magit)
  :ensure t)

;; Add evil-smartparens if smartparens is installed
(use-package evil-smartparens
  :after (evil smartparens)
  :ensure t
  :diminish
  :hook (smartparens-strict-mode . evil-smartparens-mode))

;; Vim-like search highlighting
(use-package evil-search-highlight-persist
  :ensure t
  :general
  (:prefix "SPC" :states 'normal "SPC" #'evil-search-highlight-persist-remove-all)
  :config (global-evil-search-highlight-persist t))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
;;; init-evil ends here

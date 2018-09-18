;;; package --- Initializes my Evil settings.
;;; Commentary:
;;; Vim all the things! This must be loaded after init-rust and
;;; init-which-key.
;;; Code:
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-want-integration nil)
  :ensure t
  :config
  (evil-mode 1)

  ;; Make '_' count as part of a word (like real Vim, unlike Emacs)
  (modify-syntax-entry ?_ "w")

  ;; Add command to delete buffer without closing split
  (evil-define-command delete-buffer-preserve-split ()
    "Deletes the current buffer, like :bd, but doesn't close the split"
    (let ((prev-buffer (current-buffer)))
      (evil-prev-buffer)
      (evil-delete-buffer prev-buffer)))

  (evil-ex-define-cmd "Bd" #'delete-buffer-preserve-split)

  ;; Add ex-command for magit
  (when (fboundp #'magit-status)
    (evil-ex-define-cmd "git" 'magit-status))

  ;; TODO - change these to only work in cargo-minor-mode
  ;; Define some cargo commands for Rust mode
  (when (fboundp #'cargo-minor-mode)
    (evil-ex-define-cmd "build" #'cargo-process-build)
    (evil-ex-define-cmd "check" #'cargo-process-check)
    (evil-ex-define-cmd "clippy" #'cargo-process-clippy)
    (evil-ex-define-cmd "fmt" #'cargo-process-fmt)
    (evil-ex-define-cmd "test" #'cargo-process-test))

  ;; TODO - Maybe move these to which-key's init?
  ;; Allow evil operator hints in which-key
  (when (fboundp #'which-key-mode)
    (setq which-key-allow-evil-operators t)
    (setq which-key-show-operator-state-maps t))

  ;; FIXME - this doesn't work and I don't know why
  ;; Diminish the mode-line for undo-tree, which is a dep of evil-mode
  (when (fboundp #'diminish)
    (diminish 'undo-tree-mode)))


;; Add Vim bindings to many modes
(use-package evil-collection
  :after evil
  :ensure t
  ;; This enables vim bindings in minibuffer
  ;:custom (evil-collection-setup-minibuffer t)
  :custom (evil-collection-company-use-tng nil)
  :config (evil-collection-init))


;; Add evil-magit
(use-package evil-magit
  :after (evil magit)
  :ensure t
  :config)


;; Add evil-smartparens if smartparens is installed
(use-package evil-smartparens
  :after (evil smartparens)
  :ensure t
  :diminish
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  ;; If we use smartparens in non-lispy languages, it's probably
  ;; better to only enable evil-smartparens for specific languages.
  )


;; Vim-like search highlighting
(use-package evil-search-highlight-persist
  :ensure t
  :config (global-evil-search-highlight-persist t))


(provide 'init-evil)
;;; init-evil ends here

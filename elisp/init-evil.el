;;; package --- Initializes my Evil settings.

;;; Commentary:

;;; Code:

;; Function to make ESC actually escape more things (like C-g)
;; For use with evil mode
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

;; Evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  ;; Make ESC replace C-g
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  (global-set-key [escape] 'evil-exit-emacs-state)

  ;; Fix C-u not scrolling up - evil-want-C-u-scroll seems to not work
  (define-key evil-insert-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

  ;; Add vimmy keybindings to neotree
  ;; These don't work
  (evil-define-key 'normal neotree-mode-map
    (kbd "TAB") 'neotree-enter
    (kbd "SPC") 'neotree-enter
    (kbd "RET") 'neotree-enter
    (kbd "q") 'neotree-hit)

  ;; Add command to delete buffer without closing split
  (evil-define-command delete-buffer-preserve-split ()
    "Deletes the current buffer, like :bd, but doesn't close the split"
    (let ((prev-buffer (current-buffer)))
      (evil-prev-buffer)
      (evil-delete-buffer prev-buffer)))

  (evil-ex-define-cmd "Bd" #'delete-buffer-preserve-split)

  ;; Use projectile like Vim's CtrlP plugin
  (when (fboundp 'projectile-mode)
    (define-key evil-normal-state-map (kbd "C-p") #'projectile-find-file))

  ;; Add evil-magit and create ex-command for magit-status
  (when (fboundp 'magit-status)
    (use-package evil-magit
      :ensure t)
    (evil-ex-define-cmd "git" 'magit-status))

  ;; Racer
  (when (fboundp 'racer-mode)
    (evil-define-key 'normal rust-mode-map (kbd "gd") #'racer-find-definition))

  ;; Define some cargo commands for Rust mode
  (when (fboundp #'cargo-minor-mode)
    (evil-ex-define-cmd "build" #'cargo-process-build)
    (evil-ex-define-cmd "check" #'cargo-process-check)
    (evil-ex-define-cmd "clippy" #'cargo-process-clippy)
    (evil-ex-define-cmd "fmt" #'cargo-process-fmt)
    (evil-ex-define-cmd "test" #'cargo-process-test))

  ;; Allow evil operator hints in which-key
  (when (fboundp #'which-key-mode)
    (setq which-key-allow-evil-operators t)
    (setq which-key-show-operator-state-maps t))

  ;; Diminish the mode-line for undo-tree, which is a dep of evil-mode
  (diminish 'undo-tree-mode)

  ;; Vim-like search highlighting
  (use-package evil-search-highlight-persist
    :ensure t
    :config
    (global-evil-search-highlight-persist t)))

(provide 'init-evil)
;;; init-evil ends here

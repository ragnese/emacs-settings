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

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "SPC"))

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

  (evil-ex-define-cmd "Bd" 'delete-buffer-preserve-split)

  ;; Diminish the mode-line for undo-tree, which is a dep of evil-mode
  (diminish 'undo-tree-mode)

  ;; Vim-like search highlighting
  (use-package evil-search-highlight-persist
    :ensure t
    :config
    (global-evil-search-highlight-persist t)
    (evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)))

(provide 'init-evil)
;;; init-evil ends here

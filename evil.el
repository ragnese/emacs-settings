;; Make ESC actually escape more things (like C-g)
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
  :init
  ;; Give us back Ctrl+U for vim emulation
  (setq evil-want-C-u-scroll t)
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
  ;; Leader key
  (setq evil-leader/in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC"))

;; Vim-like search highlighting
(use-package evil-search-highlight-persist
  :ensure t
  :config
  (global-evil-search-highlight-persist t)
  (evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all))

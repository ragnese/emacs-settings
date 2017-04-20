(blink-cursor-mode 0)
;; Can only turn off toolbar in GUI mode
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))

;; Diplay line number to left of buffer
(global-linum-mode 1)

;; Display (row, col) in mode line
(setq column-number-mode t)

;; Make scrolling way slower
(setq mouse-wheel-scroll-amount '(0.07))

;; Make scrolling not accelerate
(setq mouse-wheel-progressive-speed nil)

;; Stop the annoying beep
(setq ring-bell-function 'ignore)

;; When using built-in customize options, put the results into custom.el
;; instead of init.el. Then load that file from here.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Auto-indent on newline
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Easier window navigation with S-arrows
(windmove-default-keybindings)

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file "~/.emacs.d")))

;; Package management stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Give us back Ctrl+U for vim emulation
;; NOTE: Must be set before (require 'evil)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(require 'molokai-theme)
(load-theme 'molokai t)

;; Make ESC actually escape more things (like C-g)
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; Function to install required package if it doesn't already exist
(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given package."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; Leader key in Evil
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

;; Vim-like search highlighting
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

;; No blinking cursor
(blink-cursor-mode 0)

;; Remove welcome screen
(setq inhibit-startup-screen t)

;; Can only turn off toolbar in GUI mode
(when window-system
  (tool-bar-mode 0))

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
;;(define-key global-map (kbd "RET") 'newline-and-indent)

;; Not used yet. Allows us to modularize init.el
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file "~/.emacs.d")))

;; Package management stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Function to install required package if it doesn't already exist
(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given package."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require-package 'use-package)
(require 'use-package)

;; Color scheme
(use-package molokai-theme
  :ensure t
  :config
  (load-theme 'molokai t))

;; Company mode for completions
(use-package company
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'global-company-mode)
  ;; Reduce the time after which the company auto completion popup opens
  (setq company-idle-delay 0.2)
  ;; Reduce the number of characters before company kicks in
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t))

;; Flycheck for syntax checking
(use-package flycheck
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'global-flycheck-mode))

;; File tree
(use-package neotree
  :ensure t
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hit))

;; Make sure Emacs's PATH matches shell's on macOS
(use-package exec-path-from-shell
  :if (eq window-system 'ns)
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(load-user-file "evil.el")
(load-user-file "mu4e.el")
(load-user-file "rust.el")

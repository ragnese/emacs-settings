;;; package --- Emacs init.el
;;; Commentary:
;;; Code:

;; No blinking cursor
(blink-cursor-mode 0)

;; Remove welcome screen
(setq inhibit-startup-screen t)

;; Can only turn off toolbar in GUI mode
(when window-system
  (tool-bar-mode 0))

;; Display (row, col) in mode line
(setq column-number-mode t)

;; Don't wrap lines
;;(set-default 'truncate-lines t)

;; Make scrolling way slower
(setq mouse-wheel-scroll-amount '(0.07))

;; Make scrolling not accelerate
(setq mouse-wheel-progressive-speed nil)

;; Stop the annoying beep
(setq ring-bell-function 'ignore)

;; Highlight parentheses in programming major modes
(add-hook 'prog-mode-hook 'show-paren-mode)

;; When using built-in customize options, put the results into custom.el
;; instead of init.el. Then load that file from here.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Ido mode
;;(ido-mode 1)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)

;; Auto-indent on newline
;;(define-key global-map (kbd "RET") 'newline-and-indent)

;; Package management stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Function to install required package if it doesn't already exist
(defun require-package (package)
  "Install PACKAGE if not already installed."
  (setq-default highlight-tabs t)
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require-package 'use-package)
(require 'use-package)

;; Faster version of built-in linum mode
(use-package nlinum
  :ensure t
  :config
  (global-nlinum-mode))

;; Color scheme
(use-package molokai-theme
  :ensure t
  :config
  (load-theme 'molokai t))

;; Company mode for completions
(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'prog-mode-hook 'global-company-mode)
  ;; Reduce the time after which the company auto completion popup opens
  ;;(setq company-idle-delay 0.2)
  ;; Reduce the number of characters before company kicks in
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq company-tooltip-align-annotations t))

;; Flycheck for syntax checking
(use-package flycheck
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; Highlight or otherwise annoy us when lines are too long
(use-package column-enforce-mode
  :ensure t)

;; File tree
(use-package neotree
  :ensure t)

;; Make sure Emacs's PATH matches shell's on macOS
(use-package exec-path-from-shell
  :if (eq window-system 'ns)
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package magit
  :ensure t
  :diminish auto-revert-mode
  :config
  (use-package evil-magit
    :ensure t))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (add-hook 'prog-mode-hook 'projectile-mode)
  (evil-define-key 'normal prog-mode-map (kbd "C-p") 'projectile-find-file)
  (evil-define-key 'insert prog-mode-map (kbd "C-p") 'projectile-find-file)
  (evil-define-key 'visual prog-mode-map (kbd "C-p") 'projectile-find-file))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  ;; Do not show "./" and "../" in the `counsel-find-file' completion list
  (setq ivy-extra-directories nil) ; default value: ("../" "./")
  (defun modi/ivy-kill-buffer ()
    (interactive)
    (ivy-set-action 'kill-buffer)
    (ivy-done))
  (bind-keys
   :map ivy-switch-buffer-map
   ("C-k" . modi/ivy-kill-buffer))
  (use-package counsel-projectile
    :ensure t
    :config
    (counsel-projectile-on)))

;; Add our own config directory to the load-path list
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'init-evil)
(require 'init-rust)
;(require 'init-helm)
;(require 'init-mu4e)

(provide 'init)
;;; init.el ends here

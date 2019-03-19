;;; init.el --- Emacs init -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(setq debug-on-error nil)

;; Tweak garbage collection
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; No blinking cursor
(blink-cursor-mode 0)

;; Remove welcome screen
(setq inhibit-startup-screen t)

;; Can only turn off toolbar in GUI mode
(when window-system
  (tool-bar-mode 0))

;; Remove scrollbars like a ha><0r
(scroll-bar-mode -1)

;; Display (row, col) in mode line
(setq column-number-mode t)

;; Don't wrap lines
;(set-default 'truncate-lines t)

;; Make scrolling way slower
(setq mouse-wheel-scroll-amount '(0.07))

;; Make scrolling not accelerate
(setq mouse-wheel-progressive-speed nil)

;; Stop the annoying beep
(setq ring-bell-function 'ignore)

;; Highlight parentheses in programming major modes
(add-hook 'prog-mode-hook #'show-paren-mode)

;; Line numbers in programming major modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; No tabs for indent
(setq-default indent-tabs-mode nil)

;; Allow primary selection clipboard (highlight + middle-click)
(setq select-enable-primary t)

;; Paste where mouse cursor is (nil, default) or where point is (t)
;(setq mouse-yank-at-point nil)

;; No auto-backups (if I want old versions of a file, I'll use VC)
(setq make-backup-files nil)

;; Turning this off speeds up cursor movement. I don't know what it does...
(setq auto-window-vscroll nil)

;; When using built-in customize options, put the results into custom.el
;; instead of init.el. Then load that file from here.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Add our own config directory to the load-path list
(add-to-list 'load-path "~/.emacs.d/elisp")

;; For require-package
(require 'custom-functions "~/.emacs.d/elisp/custom-functions.el")

;; Package management stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require-package 'use-package)
(eval-when-compile
  (require 'use-package))

(setq use-package-compute-statistics t)

;; This must be first, since my use-package declarations depend on it
(use-package init-general)
(use-package init-diminish)
(use-package init-modeline)
;; Make sure Emacs's PATH matches shell's
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))
(use-package init-midnight)
(use-package init-ibuffer)
(use-package init-occur)
(use-package init-swiper)
;; Color theme(s)
(use-package init-theme)
;; Fuzzy finding things (files, buffers, etc)
(use-package init-ivy)
;; Project awareness
(use-package init-projectile)
;; Completion
(use-package init-company)
;; Git porcelain
(use-package init-magit)
;; macOS fix for PATH
(use-package init-macos)
;; file tree pane
(use-package init-treemacs)
;; Change font colors when lines are too long
(use-package init-column-enforce-mode
  :disabled)
;; Syntax checking
(use-package init-flycheck)
;; Which-key gives pop up hints for keybindings
(use-package init-which-key)
;; Manage Docker containers
(use-package init-docker)
;; Vim - NOTE: Make sure it's after which-key
(use-package init-evil)
(use-package init-org)
(use-package init-ox-hugo)
;; Tries to guess the correct indent rules for a file
(use-package init-dtrt-indent
  :disabled)
(use-package init-ace-window)
;; Language specific stuff
(use-package init-lsp)
(use-package init-auctex)
(use-package init-python)
(use-package init-elixir)
(use-package init-clojure)
(use-package init-geiser)
(use-package init-lisps)
(use-package init-rust)
(use-package init-php)
(use-package init-swift)
(use-package init-javascript)
(use-package init-cl)
(use-package init-dockerfile)

(provide 'init)
;;; init.el ends here

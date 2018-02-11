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
(add-hook 'prog-mode-hook 'show-paren-mode)

;; No tabs for indent
(setq-default indent-tabs-mode nil)

;; Allow primary selection clipboard (highlight + middle-click)
(setq select-enable-primary t)

;; Paste where mouse cursor is (nil, default) or where point is (t)
;(setq mouse-yank-at-point nil)

;; No auto-backups (if I want old versions of a file, I'll use VC)
(setq make-backup-files nil)

;; When using built-in customize options, put the results into custom.el
;; instead of init.el. Then load that file from here.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Add our own config directory to the load-path list
(add-to-list 'load-path "~/.emacs.d/elisp")

;; For require-package
(require 'custom-functions)

;; Package management stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require-package 'use-package)
(eval-when-compile
  (require 'use-package))

;; This must be first, since my use-package declarations depend on it
(require 'init-diminish)
;; Color theme(s)
(require 'init-theme)
;; Fuzzy finding things (files, buffers, etc)
(require 'init-ivy)
;; Project awareness
(require 'init-projectile)
;; Completion
(require 'init-company)
;; Git porcelain
(require 'init-magit)
;; macOS fix for PATH
(require 'init-macos)
;; file tree pane
(require 'init-treemacs)
;; Change font colors when lines are too long
(require 'init-column-enforce-mode)
;; Syntax checking
(require 'init-flycheck)
;; Which-key gives pop up hints for keybindings
(require 'init-which-key)
(require 'init-org)
;; Language specific stuff
(require 'init-auctex)
(require 'init-python)
(require 'init-elixir)
(require 'init-clojure)
(require 'init-geiser)
(require 'init-lisps)
(require 'init-rust)
;(require 'init-rust2) ; experiment with RLS
;; Vim - NOTE: Make sure it's after which-key and init-rust
(require 'init-evil)
;; Use for keybindings - Should load last to not get overwritten
(require 'init-general)

(provide 'init)
;;; init.el ends here

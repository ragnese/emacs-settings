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

;; The eldoc minor mode button is useless
;; NOTE: This must be after requiring use-package, since
;; diminish is a dep thereof.
(diminish 'eldoc-mode)

;; Add our own config directory to the load-path list
(add-to-list 'load-path "~/.emacs.d/elisp")
;; Faster than built-in line numbering
(require 'init-nlinum)
;; Color theme(s)
(require 'init-theme)
;; Vim
(require 'init-evil)
;; Project awareness
(require 'init-projectile)
;; Fuzzy finding things (files, buffers, etc)
;; NOTE: Must be required after projectile
(require 'init-ivy)
;; Completion
(require 'init-company)
;; Git porcelain
(require 'init-magit)
;; Do Rust
(require 'init-rust)
;; macOS fix for PATH
(require 'init-macos)
;; file tree pane
(require 'init-neotree)
;; Change font colors when lines are too long
(require 'init-column-enforce-mode)
;; Syntax checking
(require 'init-flycheck)
;(require 'init-helm)
;(require 'init-mu4e)

(provide 'init)
;;; init.el ends here

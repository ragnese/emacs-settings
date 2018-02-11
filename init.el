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

;; Function to rename file in current buffer
(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
	(message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
	(cond
	 ((vc-backend filename) (vc-rename-file filename new-name))
	 (t
	  (rename-file filename new-name t)
	  (set-visited-file-name new-name t t)))))))

(defun add-to-path (path)
  "Add PATH to $PATH env variable."
  (interactive "D:")
  (setenv "PATH" (concat (getenv "PATH") (concat ":" path))))

(defun add-to-exec-path (path)
  "Add PATH to 'exec-path'."
  (interactive "D:")
  (setq exec-path (append exec-path '(path))))

(defun new-project ()
  "Initialize a new git repo and add it to projectile's known projects.
Requires magit and projectile packages."
  (interactive)
  (let ((project-dir (expand-file-name
                      (read-directory-name "New project root:"))))
    (magit-init project-dir)
    (projectile-add-known-project project-dir)
    (setq default-directory project-dir)))

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
(eval-when-compile
  (require 'use-package))

;; Add our own config directory to the load-path list
(add-to-list 'load-path "~/.emacs.d/elisp")
;; This must be first, since my use-package declarations depend on it
(require 'init-diminish)
;; Faster than built-in line numbering
;;(require 'init-nlinum)
;; Color theme(s)
(require 'init-theme)
;; Fuzzy finding things (files, buffers, etc)
;(require 'init-ivy)
;; Project awareness
(require 'init-projectile)
;; Completion
(require 'init-company)
;; Git porcelain
(require 'init-magit)
;; Do Rust
(require 'init-rust)
;(require 'init-rust2) ; experiment with RLS
;; macOS fix for PATH
(require 'init-macos)
;; file tree pane
;(require 'init-neotree)
(require 'init-treemacs)
;; Change font colors when lines are too long
(require 'init-column-enforce-mode)
;; Syntax checking
(require 'init-flycheck)
;; Scheme
(require 'init-geiser)
;; Which-key gives pop up hints for keybindings
(require 'init-which-key)
;; Use for leader-key based keybindings
(require 'init-general)
(require 'init-org)
;(require 'init-helm)
;(require 'init-mu4e)
(require 'init-auctex)
(require 'init-python)
(require 'init-elixir)
(require 'init-clojure)
(require 'init-lisps)
;; Vim - NOTE: Make sure it's after everyone else
(require 'init-evil)

(provide 'init)
;;; init.el ends here

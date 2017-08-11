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
;;(require 'init-nlinum)
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
;; Do Rust
(require 'init-rust)
;(require 'init-rust2) ; experiment with RLS
;; macOS fix for PATH
(require 'init-macos)
;; file tree pane
(require 'init-neotree)
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
;; Vim - NOTE: Make sure it's after everyone else
(require 'init-evil)

(provide 'init)
;;; init.el ends here

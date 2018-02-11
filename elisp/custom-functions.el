;;; package --- Useful functions
;;; Commentary:
;;; Code:
;; Function to install required package if it doesn't already exist
(defun require-package (package)
  "Install PACKAGE if not already installed."
  (setq-default highlight-tabs t)
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


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


;; Function to make ESC actually escape more things (like C-g)
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))


(provide 'custom-functions)
;;; custom-functions.el ends here

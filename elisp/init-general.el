;;; package --- Initializes my General settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package general
  :ensure t
  :config
  (let ((my-leader "SPC"))
    ;; Globals
    (general-define-key
     "C-x C-b" 'ibuffer)

    (when (fboundp #'evil-mode)
      (general-define-key :prefix my-leader
                          :keymaps 'normal
                          "be" #'ivy-switch-buffer)
      (general-define-key :keymaps 'global-map
                          "M-u" #'universal-argument)
      (general-define-key :keymaps 'universal-argument-map
                          "M-u" #'universal-argument-more))

    (when (fboundp #'evil-search-highlight-persist-remove-all)
      (general-define-key :prefix my-leader
                          :keymaps 'normal
                          "SPC" #'evil-search-highlight-persist-remove-all))

    (when (fboundp #'projectile-mode)
      ;; Use projectile like Vim's CtrlP plugin
      (general-define-key :keymaps 'normal (kbd "C-p") #'projectile-find-file)
      (general-define-key :prefix my-leader
                          :keymaps 'normal
                          "p" #'projectile-switch-project))

    (when (fboundp #'smartparens-mode)
      (general-define-key
       "C-<right>" #'sp-forward-slurp-sexp
       "M-<right>" #'sp-forward-barf-sexp
       "C-<left>" #'sp-backward-slurp-sexp
       "M-<left>" #'sp-backward-barf-sexp))

    (when (fboundp #'treemacs)
      (general-define-key "<f8>" #'treemacs))

    ;; Using minor-mode definer is a workaround because some binding don't
    ;; work until a state change in Evil mode.
    (general-define-key :definer 'minor-mode
                        :states 'normal
                        :keymaps 'dired-mode
                        "RET" #'dired-find-alternate-file)

    ;; Using minor-mode definer is a workaround because some binding don't
    ;; work until a state change in Evil mode.
    (general-define-key :definer 'minor-mode
                        :states 'normal
                        :keymaps 'dired-mode
                        "^" (lambda ()
                              (interactive)
                              (find-alternate-file "..")))))

(provide 'init-general)
;;; init-general ends here

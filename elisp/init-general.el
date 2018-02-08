;;; package --- Initializes my General settings.
;;; Commentary:
;;; Code:
(use-package general
  :ensure t
  :config
  (let ((my-leader "SPC"))
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
          "M-<left>" #'sp-backward-barf-sexp))))
(provide 'init-general)
;;; init-general ends here
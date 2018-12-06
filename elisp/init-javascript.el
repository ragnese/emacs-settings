;;; init-javascript.el --- Initializes my JavaScript settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package nodejs-repl
  :commands nodejs-repl
  :ensure t)

(use-package js2-mode
  :ensure t
  :interpreter (("node" . js2-mode))
  :mode (("\\.js\\'" . js2-mode)))

(use-package tide
  :ensure t
  :after js2-mode
  :hook (js2-mode . tide-setup)
  :config
  (when (fboundp 'flycheck-add-next-checker)
    (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)))

(use-package mocha
  :ensure t
  :after js2-mode
  :custom
  (mocha-options "--recursive")
  (mocha-reporter "nyan"))

(provide 'init-javascript)
;;; init-javascript.el ends here

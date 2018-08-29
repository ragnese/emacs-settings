;;; package --- Initializes my JavaScript settings.
;;; Commentary:
;;; Code:
(use-package nodejs-repl
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
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))

(use-package mocha
  :ensure t
  :custom
  (mocha-options "--recursive")
  (mocha-reporter "nyan"))

(provide 'init-javascript)
;;; init-javascript.el ends here

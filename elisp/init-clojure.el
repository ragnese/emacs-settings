;;; init-clojure.el --- Initializes my Clojure settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package clojure-mode
  :mode "\\.clj[sc]\\'"
  :ensure t)

(use-package cider
  :after clojure-mode
  :ensure t)

(provide 'init-clojure)
;;; init-clojure.el ends here

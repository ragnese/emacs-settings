;;; package --- Initializes my Clojure settings. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package clojure-mode
  :ensure t)

(use-package cider
  :after clojure-mode
  :ensure t)

(provide 'init-clojure)
;;; init-clojure.el ends here

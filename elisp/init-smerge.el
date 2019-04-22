;;; init-smerge.el --- Initializes my Smerge settings. -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package smerge
  :ensure nil
  :general ('normal 'smerge-mode-map
                    "C-c n" #'smerge-next
                    "C-c p" #'smerge-prev
                    "C-c u" #'smerge-keep-upper
                    "C-c l" #'smerge-keep-lower
                    "C-c b" #'smerge-keep-all
                    "C-c a" #'smerge-keep-all))

(provide 'init-smerge)
;;; init-smerge.el ends here

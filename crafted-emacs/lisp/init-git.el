(use-package magit
  :ensure t
  :init (setq magit-diff-refine-hunk t)
  )
(use-package smerge-mode
  :ensure t
  :hook (find-file . (lambda ()
                       (save-excursion
                         (goto-char (point-min))
                         (when (re-search-forward "^<<<<<<< " nil t)
                           (smerge-mode 1))))))
(use-package magit-todos
  :ensure t
  :init
  (magit-todos-mode 1)
  )
                                        ; :TODO:
(provide 'init-git)

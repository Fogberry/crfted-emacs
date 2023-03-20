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

(provide 'init-git)

(use-package projectile
  :ensure t
  :bind (:map projectile-mode-map
              ("C-c C-p" . projectile-command-map))
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-mode-line-prefix ""
        projectile-sort-order 'recentf
        projectile-use-git-grep t)
  )

(provide 'init-project)

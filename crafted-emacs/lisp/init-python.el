(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  )

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))
(use-package python-pytest)

(provide 'init-python)

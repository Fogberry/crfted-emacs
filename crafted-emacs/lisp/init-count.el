(use-package beancount
  :load-path "plugin/beancount-mode/"
  :ensure nil
  :mode ("\\.bean$" . beancount-mode)
  :hook (beancount-mode . outline-minor-mode)
  )

(provide 'init-count)

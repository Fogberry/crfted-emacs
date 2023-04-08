(use-package corfu
  :bind
  (:map corfu-map
        ([backtab] . corfu-insert-separator)
        )
  )
(use-package consult
  :bind
  ("C-x C-r" . consult-recent-file))
(provide 'init-completion)

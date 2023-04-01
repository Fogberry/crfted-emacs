(use-package corfu
  :bind
  (:map corfu-map
        ([backtab] . corfu-insert-separator)
        )
  )

(provide 'init-completion)

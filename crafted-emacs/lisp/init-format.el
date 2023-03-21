(use-package format-all
  :hook (
         (prog-mode . format-all-mode)
         (format-all-mode . format-all-ensure-formatter))
  )

(provide 'init-format)

(use-package format-all
  :hook (
         (prog-mode-hook . format-all-mode)
         (format-all-mode-hook . format-all-ensure-formatter))
  )

(provide 'init-format)

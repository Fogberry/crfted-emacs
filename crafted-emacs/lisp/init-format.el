(use-package format-all
  :hook (
         (prog-mode . (lambda ()
                        (unless (derived-mode-p 'text-mode)(format-all-mode) )))
         (format-all-mode  . format-all-ensure-formatter)

         )
  )

(provide 'init-format)

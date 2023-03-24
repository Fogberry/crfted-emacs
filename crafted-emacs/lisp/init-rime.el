(use-package posframe)

(use-package rime
  :ensure t
  :config
  (setq rime-disable-predicates
        '(meow-normal-mode-p
          meow-motion-mode-p
          meow-keypad-mode-p))
  (setq rime-posframe-properties
        (list :font "WenQuanYi Micro Hei Mono"
              :internal-border-width 16))
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe)
  (rime-user-data-dir "~/.local/share/fcitx5/rime"))

(provide 'init-rime)

(setq-default delete-by-moving-to-trash t
              window-combination-resize t
              x-stretch-cursor t)

(setq undo-limit 8000000
      auto-save-default t
      password-cache-expiry nil
      scroll-preserve-screen-position 'always
      scroll-margin 2
      word-wrap-by-category t
      dired-mouse-drag-files t ;;emacs29 supports
      mouse-drag-and-drop-region-cross-program t
      mouse-1-click-follows-link nil
      make-backup-files nil
      )

(scroll-bar-mode)

(push  '(alpha-background . 95) default-frame-alist)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


(use-package display-line-numbers
  :ensure nil
  :hook ((prog-mode yaml-mode conf-mode) . display-line-numbers-mode)
  :init (setq display-line-numbers-width-start t))


(setq mouse-yank-at-point nil)

;; (pixel-scroll-precision-mode 1)
;; (setq pixel-scroll-precision-large-scroll-height 60
;; (pixel-scroll-precision-interpolation-factor 30.0)

(use-package pangu-spacing

  :init
  (global-pangu-spacing-mode 1)
  (add-hook 'org-mode-hook
            #'(lambda ()
                (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))
  )

(use-package wakatime-mode
  :ensure t
  :init (global-wakatime-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(provide 'init-base)

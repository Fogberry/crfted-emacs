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
      )

;; (display-time-mode 1)

(scroll-bar-mode)

(push  '(alpha-background . 95) default-frame-alist)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq mouse-yank-at-point nil)

;; (pixel-scroll-precision-mode 1)
;; (setq pixel-scroll-precision-large-scroll-height 60
;; (pixel-scroll-precision-interpolation-factor 30.0)
(use-package wakatime-mode
  :ensure t
  :init (global-wakatime-mode))


(provide 'init-base)

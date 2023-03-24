(setq visible-bell t
      inhibit-compacting-font-caches t  ; Don’t compact font caches during GC
      delete-by-moving-to-trash t       ; Deleting files go to OS's trash folder
      make-backup-files nil             ; Forbide to make backup files
      auto-save-default nil             ; Disable auto save
      )

(use-package wakatime-mode
  :ensure t
  :init (global-wakatime-mode))


(provide 'init-base)

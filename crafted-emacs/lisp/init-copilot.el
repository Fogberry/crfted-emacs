;; (use-package codeium
;;   :quelpa ((codeium :fetcher github :repo "Exafunction/codeium.el") :upgrade t)
;;
;;     :hook (rjsx-mode . (lambda()
;;                          (setq-local completion-at-point-functions
;;                                      (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point))))
;;   )
;;   :config
;;   (setq use-dialog-box nil)
;;
;;   )
;;

(use-package gptel
  )

(provide 'init-copilot)

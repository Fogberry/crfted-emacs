(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; Mode-line
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-height 1
        doom-modeline-window-width-limit 100
        doom-modeline-minor-modes nil))

(use-package hide-mode-line
  :ensure t
  :hook (((eshell-mode shell-mode
                       term-mode vterm-mode
                       lsp-ui-imenu-mode
                       pdf-annot-list-mode) . hide-mode-line-mode)))

(use-package page-break-lines
  :ensure t
  :hook (after-init . global-page-break-lines-mode))

(use-package parrot
  :ensure t
  :config
  (parrot-mode)
  (setq parrot-num-rotations nil))


(provide 'init-ui)

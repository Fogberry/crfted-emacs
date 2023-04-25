(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-height 1
        doom-modeline-window-width-limit 100
        doom-modeline-minor-modes nil))

(use-package hide-mode-line
  :hook (((eshell-mode shell-mode
                       term-mode vterm-mode
                       lsp-ui-imenu-mode
                       pdf-annot-list-mode) . hide-mode-line-mode)))

(use-package page-break-lines
  :hook (after-init . global-page-break-lines-mode))

(use-package parrot
  :config
  (parrot-mode)
  (setq parrot-num-rotations nil))

(use-package dashboard
  :hook (dashboard-mode . (lambda ()
                            ;; No title
                            (setq-local frame-title-format nil)
                            ;; Enable `page-break-lines-mode'
                            (when (fboundp 'page-break-lines-mode)
                              (page-break-lines-mode 1))))
  :bind (("<f2>" . dashboard-open)
         :map dashboard-mode-map
         )
  ;; TODO add load-session
  :init
  (setq
   dashboard-startup-banner "~/crafted-emacs/crafted-emacs/xemacs_color.svg"
   dashboard-center-content t
   dashboard-page-separator "\n\f\n"
   dashboard-set-file-icons t
   dashboard-set-heading-icons t
   dashboard-set-footer t
   dashboard-set-navigator t
   dashboard-show-shortcuts nil
   dashboard-set-init-info t
   dashboard-projects-backend 'projectile
   dashboard-items '((recents  . 12)
                     (bookmarks . 3)
                     (projects . 5)
                     (agenda . 5)))
  (dashboard-setup-startup-hook))


(provide 'init-ui)

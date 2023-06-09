(use-package dirvish
  :ensure t
  :init
  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
   '(("h" "~/" "Home")
     ("c" "~/Projects/Codes" "Codes")
     ("d" "~/Downloads" "Downloads")
     ("D" "~/Documents" "Documents")
     ("e" "~/.emacs.d" ".emacs.d")
     ("f" "~/.config" ".config")
     ("l" "~/.local/share" ".local/share")
     ("p" "~/Projects" "Projects")
     ("P" "~/Pictures" "Pictures")
     ("r" "~/Repo" "Repo")
     ("t" "~/.local/share/Trash/files" "TrashCan")
     ("o" "~/Org" "Org")
     ("n" "~/Org/Notes" "Org/Notes")))
  :config
  ;; (dirvish-peek-mode) ; Preview files in minibuffer
  ;; (dirvish-side-follow-mode) ; similar to `treemacs-follow-mode'
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-attributes
        '(all-the-icons file-size subtree-state vc-state git-msg))
  ;;   '(all-the-icons file-time file-size subtree-state vc-state git-msg))
  (setq delete-by-moving-to-trash t)
  (setq dired-listing-switches
        "-l --almost-all --human-readable --group-directories-first --no-group")
  (define-key dirvish-mode-map (kbd "<mouse-1>") 'dirvish-subtree-toggle-or-open)
  (define-key dirvish-mode-map (kbd "<mouse-2>") 'dired-mouse-find-file-other-window)
  (define-key dirvish-mode-map (kbd "<mouse-3>") 'dired-mouse-find-file)
  :bind ; Bind `dirvish|dirvish-side|dirvish-dwim' as you see fit
  (("C-x C-d" . dirvish)
   ("C-c D" . dirvish-side)
   :map dirvish-mode-map ; Dirvish inherits `dired-mode-map'
   ("b"   . dirvish-quick-access)
   ("f"   . dirvish-file-info-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("e"   . dired-up-directory)
   ("i"   . dired-find-file)
   ("^"   . dirvish-history-last)
   ("h"   . dirvish-history-jump) ; remapped `describe-mode'
   ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
   ("v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
   ("TAB" . dirvish-subtree-toggle)
   ("M-f" . dirvish-history-go-forward)
   ("M-b" . dirvish-history-go-backward)
   ("M-l" . dirvish-ls-switches-menu)
   ("M-m" . dirvish-mark-menu)
   ("M-t" . dirvish-layout-toggle)
   ("M-s" . dirvish-setup-menu)
   ("M-e" . dirvish-emerge-menu)
   ("M-j" . dirvish-fd-jump)))

(provide 'init-dirvish)

;; (use-package codeium
;;   :quelpa ((codeium :fetcher github :repo "Exafunction/codeium.el") :upgrade t)
;;
;;   :hook (rjsx-mode . (lambda()
;;                        (setq-local completion-at-point-functions
;;                                    (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
;;   :config
;;   (setq use-dialog-box nil)
;;   )
;;

(use-package gptel
  :config
  (defvar gptel-quick--history nil)
  (defun gptel-quick (prompt)
    (interactive (list (read-string "Ask ChatGPT: " nil gptel-quick--history)))
    (when (string= prompt "") (user-error "A prompt is required."))
    (gptel-request
     prompt
     :callback
     (lambda (response info)
       (if (not response)
           (message "gptel-quick failed with message: %s" (plist-get info :status))
         (with-current-buffer (get-buffer-create "*gptel-quick*")
           (let ((inhibit-read-only t))
             (erase-buffer)
             (insert response))
           (special-mode)
           (display-buffer (current-buffer)
                           `((display-buffer-in-side-window)
                             (side . bottom)
                             (window-height . ,#'fit-window-to-buffer))))))))

  (defun gptel-rewrite-and-replace (bounds &optional directive)
    (interactive
     (list
      (cond
       ((use-region-p) (cons (region-beginning) (region-end)))
       ((derived-mode-p 'text-mode)
        (list (bounds-of-thing-at-point 'sentence)))
       (t (cons (line-beginning-position) (line-end-position))))
      (and current-prefix-arg
           (read-string "ChatGPT Directive: "
                        "You are a prose editor. Rewrite my prompt more professionally."))))
    (gptel-request
     (buffer-substring-no-properties (car bounds) (cdr bounds)) ;the prompt
     :system (or directive "You are a prose editor. Rewrite my prompt more professionally.")
     :buffer (current-buffer)
     :context (cons (set-marker (make-marker) (car bounds))
                    (set-marker (make-marker) (cdr bounds)))
     :callback
     (lambda (response info)
       (if (not response)
           (message "ChatGPT response failed with: %s" (plist-get info :status))
         (let* ((bounds (plist-get info :context))
                (beg (car bounds))
                (end (cdr bounds))
                (buf (plist-get info :buffer)))
           (with-current-buffer buf
             (save-excursion
               (goto-char beg)
               (kill-region beg end)
               (insert response)
               (set-marker beg nil)
               (set-marker end nil)
               (message "Rewrote line. Original line saved to kill-ring."))))))))
  :bind (
         ("C-c i s" . gptel-send)
         ("C-c i q" . gptel-quick)
         ("C-c i r" . gptel-rewrite-and-replace)
         ("C-c i b" . gptel))
  )

(provide 'init-copilot)

;; CSS
(use-package css-mode
  :ensure nil
  :init (setq css-indent-offset 2))

;; SCSS
(use-package scss-mode
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil))

;; LESS
(unless (fboundp 'less-css-mode)
  (use-package less-css-mode))

;; JSON
(unless (fboundp 'js-json-mode)
  (use-package json-mode))

;; JavaScript
(use-package js2-mode
  :mode (("\\.js\\'" . js2-mode))
  :interpreter (("node" . js2-mode))
  :hook ((js2-mode . js2-imenu-extras-mode)
         (js2-mode . js2-highlight-unused-variables-mode))
  :config
;  (with-eval-after-load 'flycheck
;    (when (or (executable-find "eslint_d")
;              (executable-find "eslint")
;              (executable-find "jshint"))
                                        ;      (setq js2-mode-show-strict-warnings nil)))
  )

;; jsx
(use-package rjsx-mode
  :mode (("\\.jsx\\'" . rjsx-mode))
  )

;; typescript,tsx
(use-package typescript-mode
  :mode ("\\.ts[x]\\'" . typescript-mode))

;; Run Mocha or Jasmine tests
(use-package mocha
  :config (use-package mocha-snippets))

;; Major mode for editing web templates
(use-package web-mode
  :mode "\\.\\(phtml\\|php\\|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\)$"
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

;; Format HTML, CSS and JavaScript/JSON
(use-package prettier
  :ensure t
  :hook ((js-mode js2-mode css-mode rjsx-mode web-mode) . prettier-mode)
  :init (setq prettier-pre-warm 'none))

(provide 'init-web)

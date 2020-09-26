(add-hook 'rust-mode-hook
          '(lambda()
             (racer-mode t)
             (flymake-mode t)
             (flymake-cursor-mode t)
             (setq flymake-check-was-interrupted t)))

(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(add-to-list 'exec-path(expand-file-name "~/.cargo/bin/"))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; flymake

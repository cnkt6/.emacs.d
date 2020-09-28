(require 'tide)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-hook 'typescript-mode-hook
          (lambda()
            (interactive)
            (tide-setup)
            (flycheck-mode +1)
            (eldoc-mode +1)
            (company-mode +1)))

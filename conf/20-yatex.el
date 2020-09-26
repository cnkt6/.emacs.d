(require 'yatex)
(add-to-list 'auto-mode-alist '("\\.tex\\'" . yatex-mode))
(setq tex-command "platex")
(setq bibtex-command "pbibtex")

(add-hook 'yatex-mode-hook
          #'(lambda ()
              (reftex-mode 1)
              (define-key reftex-mode-map
                (concat YaTeX-prefix ">") 'YaTeX-comment-region)
              (define-key reftex-mode-map
                (concat YaTeX-prefit "<") 'YaTeX-uncomment-region)))

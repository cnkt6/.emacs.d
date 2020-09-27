(add-hook 'json-mode-hook
          (lambda()
            (make-local-variable 'json-indent-level)
            (setq json-indent-level 2)))

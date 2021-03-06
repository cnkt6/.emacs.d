(add-to-list 'load-path "/usr/local/Cellar/global/6.5.5/share/gtags")
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\M-p" 'gtags-pop-stack)))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/themes/mytheme-theme"))
(load "mytheme.el")
(add-to-list 'default-frame-alist '(alpha . 85))
(set-frame-parameter nil 'alpha 0.9)

(let (mes)
  (setq mes "called linux theme")
  (message "%s" mes))

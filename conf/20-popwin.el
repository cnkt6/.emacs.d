(add-to-list 'load-path (expand-file-name "~/.emacs.d/public_repos/popwin-el"))
(when (require 'popwin nil t)
  (popwin-mode 1))

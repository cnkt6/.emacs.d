;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages") t)
  (setq load-path (append (list
                         (expand-file-name "~/.emacs.d/public_repos/aoj-submit-el")
                         )
                        load-path))
  (package-initialize)
  (unless (package-installed-p 'init-loader)
    (package-refresh-contents)
    (package-install 'init-loader))
  (setq custom-file (expand-file-name "conf/00-custom.el" user-emacs-directory))
  (when (require 'init-loader nil t)
    (init-loader-load "~/.emacs.d/conf"))
  )

;;emacs-lisp-modeのフックをセット
(add-hook 'emacs-lisp-mode
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

(when (require 'rtags nil 'noerror)
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (rtags-is-indexed)
                (define-key c++-mode-map (kbd "M-@") 'rtags-find-symbol-at-point)
                (define-key c++-mode-map (kbd "M-;") 'rtags-find-symbol)
                (define-key c++-mode-map (kbd "M-.") 'rtags-find-references)
                (define-key c++-mode-map (kbd "M-,") 'rtags-location-stack-back)))))

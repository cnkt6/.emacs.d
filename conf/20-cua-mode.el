(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-c C-m") 'cua-set-rectangle-mark)

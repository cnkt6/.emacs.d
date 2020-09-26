(require 'flymake)

(custom-set-faces
 '(flymake-errline ((((class color)) (:background "red"))))
 '(flymake-warnline ((((class color)) (:background "yellow")))))

(push '("\\.h\\'" flymake-simple-make-init flymake-master-cleanup)
      flymake-allowed-file-name-masks)

;; rust-mode
(add-hook 'rust-mode-hook
          '(lambda()
             (flymake-mode t)
             (flymake-cursor-mode t)
             (setq flymake-check-was-interrupted t)
             (local-set-key "\C-c\C-v" 'flymake-start-syntax-check)
             (local-set-key "\C-c\C-p" 'flymake-goto-prev-error)
             (local-set-key "\C-c\C-n" 'flymake-goto-next-error)
             )
          )

;;(defun flymake-cc-init ()
;;  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;         (local-file  (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
;; 
;;(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
;; 
;;(add-hook 'c++-mode-hook
;;          '(lambda ()
;;             (flymake-mode t)))
;; 
;;(defun flymake-get-make-cmdline (source base-dir)
;;  (list "make"
;;        (list "-s" "-C"
;;              base-dir
;;              (concat "CHK_SOURCES=" source)
;;              "SYNTAX_CHECK_MODE=1")))

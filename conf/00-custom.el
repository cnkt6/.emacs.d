(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "43f6e9463c0fab3faeae507e419adc195ec1bc70bfe35c01a1ea3e5785e31db0" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "4d450a0b203570222801bc8f40c38f15f35e177c17e60c006103784f09502a99" default)))
 '(flycheck-display-errors-delay 0.5)
 '(flycheck-display-errors-function
   (lambda
     (errors)
     (let
         ((message
           (mapcar
            (function flycheck-error-message)
            errors)))
       (popup-tip
        (mapconcat
         (quote identity)
         message "
")))))
 '(irony-additional-clang-options (quote ("-std=c++17")))
 '(package-selected-packages
   (quote
    (cmake-mode js2-mode slime ggtags agtags yatex sage-shell-mode flycheck yasnippet tuareg racer quickrun qml-mode org-preview-html multiple-cursors lua-mode init-loader htmlize haskell-mode google-c-style flymake-rust flymake-cursor flycheck-irony elscreen company buffer-move atom-dark-theme ac-slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-error ((((class color)) (:background "red"))))
 '(flymake-warning ((((class color)) (:background "yellow")))))

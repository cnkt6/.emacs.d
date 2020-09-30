;; Common Lisp関数 マクロ使用
(require 'cl)
;; Emacsからの質問をy/nで回答する
(fset 'yes-or-no-p 'y-or-n-p)
;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)
;;デーモン起動すると読み込まれないので注意
(when window-system
  ;; tool-barを非表示
  (tool-bar-mode 0)
  ;; scroll-barを非表示
  (scroll-bar-mode 0))

(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;;.elファイルのロードパス
(add-to-list 'load-path "~/.emacs.d/public_repos")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/rtags")


(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;;(add-to-load-path "elisp" "conf" "public_repos")

(set-language-environment "Japanese")

(prefer-coding-system 'utf-8)

;;リージョン内の行数と文字数をモードラインに表示する。(範囲指定時のみ)
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
;;(defun count-lines-and-chars ()
;;  (if mark-active
;;      (format "%d lines,%d chars "
;;    	  (count-lines (region-beginning) (region-end))
;;    	  (- (region-end) (region-beginning)))
;;    ;;これだとエコーエリアがチラつく
;;    ;;(count-lines-region (region-beginning) (region-end))
;;    ""))
;;(add-to-list 'default-mode-line-format
;;	     '(:eval (count-lines-and-chars)))

;;カラム番号を表示
(column-number-mode t)
;;ファイルサイズを表示
(size-indication-mode t)
;;時計を表示(好みに応じてフォーマットを変更可能)
(defvar display-time-interval 1)
(defvar display-time-string-forms
      '((format "%s:%s:%s" 24-hours minutes seconds)))
(setq display-time-day-and-date t) ; 曜日.月.日を表示
(display-time-mode t)
;;バッテリー残量を表示
(display-battery-mode t)
;;行番号を常に表示する
(global-linum-mode t)
;;タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;;TABの表示幅。初期値は8
(setq-default tab-width 4)
;;インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)
;;php-modeのみタブを利用しない
(add-hook 'php-mode-hook
		  (lambda ()
			(setq indent-tabs-mode nil)
			;;'+はc-basic-offsetの値を利用するという指定
			(c-set-offset 'arglist-intro '+)
			;;0はインデントなしという指定
			(c-set-offset 'arglist-close 0)
			))
;;インデントスタイルにc-sey-styleをセット
(add-hook 'c-mode-common-hook
		  (lambda ()
			(c-set-style "bsd")))
;;(when (require 'color-theme nil t)
;;  ;;テーマを読み込むための設定
;;  (color-theme-initialize)
;;  ;;テーマをhoberに変更する
;;  (color-theme-hober))

;;ウィンドウの透明度
;;(add-to-list 'default-frame-alist '(alpha . (0.8 0.8)))
;;カレントウィンドウの透明度
;;(set-frame-parameter nil 'alpha 85)

;;(set-default-font "VL Pゴシック")

;;paren-mode : 対応する括弧を強調して表示する
(setq show-paren-delay 0) ; 表示までの秒数。初期値は0.125
(show-paren-mode t) ;　有効化
;; parenのスタイル :expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;;フェイスを変更する
;; (set-face-background 'show-paren-match-face nil)
;; (set-face-underline-p 'show-paren-match-face "yellow")
;;バックアップファイルの作成場所をシステムのTempディレクトリに変更する
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
;;オートセーブファイルの作成場所をシステムのTempディレクトリに変更する
(setq auto-save-file-name-transforms
	  `((".:" ,temporary-file-directory t)))
;;ファイルが #! から始まる場合、 +x をつけて保存する
(add-hook 'after-save-hook
		  'executable-make-buffer-file-executable-if-script-p)
;;Variable binding depth exceeds max-specpdl-size 対策
(setq max-specpdl-size 6000)

;; desable auto save
(setq auto-save-default nil)

;; package install
(package-install-selected-packages)


;; encoding
;; 改行文字の文字列表現
(set 'eol-mnemonic-dos "(CRLF)")
(set 'eol-mnemonic-unix "(LF)")
(set 'eol-mnemonic-mac "(CR)")
(set 'eol-mnemonic-undecided "(?)")

;; 文字エンコーディングの文字列表現
(defun my-coding-system-name-mnemonic (coding-system)
  (let* ((base (coding-system-base coding-system))
         (name (symbol-name base)))
    (cond ((string-prefix-p "utf-8" name) "U8")
          ((string-prefix-p "utf-16" name) "U16")
          ((string-prefix-p "utf-7" name) "U7")
          ((string-prefix-p "japanese-shift-jis" name) "SJIS")
          ((string-match "cp\\([0-9]+\\)" name) (match-string 1 name))
          ((string-match "japanese-iso-8bit" name) "EUC")
          (t "???")
          )))

(defun my-coding-system-bom-mnemonic (coding-system)
  (let ((name (symbol-name coding-system)))
    (cond ((string-match "be-with-signature" name) "[BE]")
          ((string-match "le-with-signature" name) "[LE]")
          ((string-match "-with-signature" name) "[BOM]")
          (t ""))))

(defun my-buffer-coding-system-mnemonic ()
  "Return a mnemonic for `buffer-file-coding-system'."
  (let* ((code buffer-file-coding-system)
         (name (my-coding-system-name-mnemonic code))
         (bom (my-coding-system-bom-mnemonic code)))
    (format "%s%s" name bom)))

;; `mode-line-mule-info' の文字エンコーディングの文字列表現を差し替える
(setq-default mode-line-mule-info
              (cl-substitute '(:eval (my-buffer-coding-system-mnemonic))
                             "%z" mode-line-mule-info :test 'equal))

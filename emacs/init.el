(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package key-chord
  :ensure t
  :init
  (setq key-chord-two-keys-delay 0.3) ; キーの入力間隔（秒）
  :config
  (key-chord-mode 1))

;; evilのインストールと設定
(use-package evil
  :after key-chord
  :init
  (setq evil-want-C-u-scroll t) ; C-uでスクロール（Vim風）
  (setq evil-want-integration t) ; 他のパッケージとの統合を有効化
  (setq evil-want-keybinding nil) ; evil-collection用に設定
  :config
  (evil-mode 1) ; evilをグローバルに有効化
  (define-key global-map (kbd "C-x") nil) ; C-xプレフィックスを無効化
  (define-key global-map (kbd "C-u") nil) ; C-xプレフィックスを無効化
  ;; 特定のモードでのデフォルト状態を設定（オプション）
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'magit-mode 'emacs))
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (evil-set-leader 'normal (kbd "<SPC>"))
  ;; (evil-define-key 'insert global-map 
  ;;                  (kbd "jj") 'evil-normal-state
  ;; )

  (evil-define-key 'normal global-map
    (kbd "<leader> f f") 'find-file ; Leader + fでfind-file
  )
  ;; (evil-define-key 'insert global-map
  ;;   (kbd "jj") 'evil-escape)

;; evil-collection（evilの拡張キーバインド）
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; lsp
(use-package eglot
  :after evil
  :hook (prog-mode . eglot-ensure))

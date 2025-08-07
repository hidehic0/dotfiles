(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  (unless (package-installed-p 'leaf)
    (package-install 'leaf)))

(leaf mise :ensure t
  :config
  (require 'mise)
  (add-hook 'prog-mode-hook #'mise-mode)
  (add-hook 'text-mode-hook #'mise-mode)
  )




(leaf llama :ensure t)
(leaf inheritenv :ensure t)

(leaf evil :ensure t
  :leaf-defer nil
  :commands evil-define-key
  :init

  (evil-mode 1)

  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t)
  )

(leaf evil-escape :ensure t :after evil
:init

( evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jj")

(setq-default evil-escape-delay 0.5)
      )

;; Initialize package sources
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Essential Packages for Front-End Development

;; Web Mode - for HTML, CSS, JavaScript, JSX, TSX
(use-package web-mode
  :mode ("\\.html?\\'" "\\.css\\'" "\\.js\\'" "\\.jsx\\'" "\\.ts\\'" "\\.tsx\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-quoting nil)) ;; Disable auto-quoting in JSX

;; Emmet Mode - HTML & CSS expansion
(use-package emmet-mode
  :hook (web-mode css-mode))

;; JavaScript Mode
(use-package js2-mode
  :mode "\\.js\\'"
  :config
  (setq js2-basic-offset 2))

;; TypeScript Mode
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode))
  :config
  (setq typescript-indent-level 2))

;; Prettier - Code formatting for JS, JSX, and CSS
(use-package prettier-js
  :hook ((js2-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (web-mode . prettier-js-mode)))

;; Company Mode - Autocompletion
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; Tide - TypeScript Interactive Development Environment
(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save))
  :config
  (setq tide-format-options '(:indentSize 2 :tabSize 2)))

;; LSP Mode - Language Server Protocol
(use-package lsp-mode
  :commands lsp
  :hook ((js2-mode . lsp)
         (typescript-mode . lsp)
         (web-mode . lsp))
  :config
  (setq lsp-prefer-capf t)
  (setq lsp-enable-snippet nil)) ;; Disable snippets for completion

(use-package lsp-ui
  :commands lsp-ui-mode)

;; Additional Development Tools

;; Projectile - Project Management
(use-package projectile
  :config
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/projects/"))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Magit - Git integration
(use-package magit
  :commands magit-status)

;; Optional: General - for Custom Keybindings
(use-package general
  :config
  (general-define-key
   "C-c p" 'projectile-command-map
   "C-c g" 'magit-status))

;; Optional Keybindings for Navigation & Workflow
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; Buffer management
(global-set-key (kbd "C-x p") 'previous-buffer) ;; Switch to previous buffer
(global-set-key (kbd "C-x n") 'next-buffer) ;; Switch to next buffer

;; evil mode
(use-package evil
  :ensure 
  :init
  (evil-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil general magit projectile lsp-ui lsp-mode tide company prettier-js typescript-mode js2-mode emmet-mode web-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'display-buffer-alist
             '("*Warnings*"
               (display-buffer-no-window . nil)
               (allow-no-window . t)))

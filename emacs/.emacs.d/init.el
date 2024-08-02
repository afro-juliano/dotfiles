;; load my configuration path
(add-to-list 'load-path "~/.emacs.d/config/")


;; Load my files from config directory
(require 'gui-config)
(require 'melpa-config)
(require 'html-config)
(require 'markdown-config)
(require 'code-config)


(use-package try
  :ensure t)


;; Indenting in 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


(use-package which-key
  :ensure t
  :config (which-key-mode))


(use-package all-the-icons
  :ensure t)


(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq neo-smart-open t))
  :bind (("C-\\" . 'neotree-toggle))) ;; atom key


(use-package toml-mode
  :ensure t)


;; Emojisn
(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))


;; auto-complete
;; snippets for autocomplete
(use-package yasnippet
  :ensure t)

(yas-global-mode 1)


;; company auto complete library
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1
	company-minimun-prefix-length 1)
  (global-company-mode t))


;; space line
(use-package spaceline
  :ensure t)


(use-package vterm
  :ensure t
  :bind
  (:map vterm-mode-map
	("C-s-v" . vterm-yank)
	("C-s-c" . vterm-copy-mode)))


(use-package vterm-toggle
  :ensure t
  :config
  :bind ("C-c t" . vterm))


;; Move text
(global-unset-key (kbd "C-<up>"))
(global-unset-key (kbd "C-<down>"))
(use-package move-text
  :ensure t
  :config
  (progn
    (global-set-key (kbd "C-<up>") 'move-text-up)
    (global-set-key (kbd "C-<down>") 'move-text-down)))


;; Docker integration
(use-package docker
  :ensure t
  :config
  (add-hook 'dockerfile-mode t)
  :bind ("C-c d" . docker))


;; Docker compose mode
(use-package docker-compose-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)


;; Yaml mode
(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent))))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))


;; flycheck yamlint
(use-package flycheck-yamllint
  :ensure t
  :defer t
  :init
  (progn
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))))


;; Buffer tabs
(use-package centaur-tabs
  :ensure t
  :demand
  :init
  (setq centaur-tabs-enable-key-bindings t)
  :config
  (setq centaur-tabs-style "bar"
	centaur-tabs-set-bar 'over
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "*"
	centaur-tabs-set-icons t
    centaur-tabs-set-bar 'left
    centaur-tabs-set-bar 'under
    ;; Note: If you're not using Spacmeacs, in order for the underline to display
    ;; correctly you must add the following line:
    x-underline-at-descent-line t
    centaur-tabs-cycle-scope 'tabs
	centaur-tabs-height 28)
  (centaur-tabs-change-fonts (face-attribute 'default :font) 125)
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  ("C-c q" . centaur-tabs--kill-this-buffer-dont-ask)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (vterm-mode . centaur-tabs-local-mode))


;; My bindings
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;; Terraform
 (use-package terraform-mode
  ;; if using straight
  ;; :straight t

  ;; if using package.el
  ;; :ensure t
  :custom (terraform-indent-level 4)
  :config
  (defun my-terraform-mode-init ()
    ;; if you want to use outline-minor-mode
    ;; (outline-minor-mode 1)
    )

  (add-hook 'terraform-mode-hook 'my-terraform-mode-init))


;; Theme
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme #'catppuccin t)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload))

;; Space line I don't know exactly what it does
(use-package spaceline-config
  :config
  (spaceline-emacs-theme))


;; Flycheck syntax checker
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
   (setq flycheck-check-syntax-automatically '(save new-line)
         flycheck-idle-change-delay 5.0
         flycheck-display-errors-delay 0.9
         flycheck-highlighting-mode 'symbols
         flycheck-indication-mode 'left-fringe
         flycheck-standard-error-navigation t
         flycheck-deferred-syntax-check nil)
   :config
   ;; before install pylint (pip install pylint)
   ;; before install flake8 (pip install flake8)
   ;; after install, create config file (pylint --generate-rcfile > ~/.pylintrc)
   (setq flycheck-python-flake8-executable "~/.local/bin/flake8"
	 flycheck-python-pylint-executable "~/.local/bin/pylint")
   )


;; Spell
(setq 
    ispell-program-name "/usr/bin/hunspell"
    ispell-dictionary "pt_BR")

;;(require 'flyspell)
;;(eval-after-load "flyspell"
;;  '(progn
;;     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
;;     (define-key flyspell-mouse-map [mouse-3] #'undefined)))
;;
;;(add-hook 'yaml-mode-hook #'flyspell-prog-mode)
;;(add-hook 'conf-mode-hook #'flyspell-prog-mode)
;;(add-hook 'prog-mode-hook #'flyspell-prog-mode)
;;(add-hook 'toml-mode-hook #'flyspell-prog-mode)
;;(add-hook 'dockerfile-mode #'flyspell-prog-mode)
;;(add-hook 'docker-compose-mode #'flyspell-prog-mode)


(use-package flycheck-inline
  :ensure t)


(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))


;; Git config
(use-package magit
  :ensure t)


(use-package diff-hl
  :ensure t)


;; Project organization
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/Projects/")
	projectile-switch-project-action 'neotree-projectile-action
	projectile-indexing-method 'alien
	projectile-use-git-grep 1))



(use-package lsp-pyright ;; Python LSP
  :ensure t
  :hook
  ((python-mode . (lambda ()
		    (require 'lsp-pyright)
                    (lsp-deferred)))
   (flycheck-mode . (lambda ()
		      ;; Next checker check the first lsp -> flake8 -> pylint
		      ;; Waring clause check the next only if dont have errors
		      ;; If lsp dont have errors, check flake8, if lsp and flake8 dont have any eror
		      ;; check using pylint.
                      (flycheck-add-next-checker 'lsp '(warning . python-flake8))
                      (flycheck-add-next-checker 'python-flake8 '(warning . python-pylint))
                      (message "Added flycheck checkers.")))))


;; ----- lsp
(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :after lsp-mode
  :config
  (setq lsp-ui-doc-mode 1)
  (lsp-enable-which-key-integration t))

(require 'lsp-diagnostics)
(lsp-diagnostics-flycheck-enable)


;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
	 (go-mode . company-mode))
  :bind (:map go-mode-map
	      ("<f6>" . gofmt)
	      ("C-c 6" . gofmt))
  :config
  (require 'lsp-go)
  (setq lsp-go-analyses
	'((fieldalignment . t)
	  (nilness        . t)
	  (unusedwrite    . t)
	  (unusedparams   . t)))
  ;; GOPATH/bin
  (add-to-list 'exec-path "~/go/bin")
  (setq gofmt-command "goimports"))


;; Flycheck for golangci
(eval-after-load 'flycheck                                       
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))


(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))


(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))


(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)


;; emojis and hl, flyspell
(add-hook 'after-init-hook #'global-emojify-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)


(add-hook 'text-mode-hook 'display-line-numbers-mode)
; install hunspell-pt-br on aur
;;(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'hl-line-mode)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9724b3abaf500b227faa036dcf817abed9764802835ba6e8d1e475c877205157" default))
 '(package-selected-packages
   '(dockerfile-mode docker-compose-mode flycheck-yamllint yaml-mode docker-mode docker origami yasnippet-classic-snippets catppuccin-theme centaur-tabs move-text golint flycheck-golangci-lint flymake-golangci flymake-golangci-lint fly-check-golangci-lint golangci-lint gopls flycheck-inline company spaceline emojify yasnippet gnu-elpa-keyring-update lsp-jedi which-key vscode-dark-plus-theme use-package try rebecca-theme neotree ergoemacs-mode auto-complete all-the-icons ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8 :foreground "#A3BE8C" :weight extra-bold))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4 :foreground "#EBCB8B" :weight extra-bold))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2 :foreground "#D08770" :weight extra-bold))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.15 :foreground "#BF616A" :weight extra-bold))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.11 :foreground "#b48ead" :weight extra-bold))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.06 :foreground "#5e81ac" :weight extra-bold)))))

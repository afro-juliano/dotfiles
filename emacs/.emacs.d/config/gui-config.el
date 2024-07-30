;; Remove Welcome message
(setq inhibit-startup-message t
      initial-buffer-choice nil
      initial-scratch-message nil
      ;; cancel auto-save and backups
      auto-save-default nil
      make-backup-files nil
      ido-enable-flex-matching t
      ido-everywhere t)

;; Remove Menus
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Set Number
(global-linum-mode t)

;; Font size
(set-face-attribute 'default nil :font "DejaVu Sans Mono Book" :height 125)

;; flex buffer
(defalias 'list-buffers 'ibuffer-other-window) ;; ibuffer default C-x C-b

;; Update changed buffers
(global-auto-revert-mode t)

(provide 'gui-config)

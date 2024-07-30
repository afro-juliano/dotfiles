;; Packages
(require 'package)
(setq package-enable-at-startup nil) ; disable packages initialization

; MELPA - repository
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize) ; Initiliaze packages

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'melpa-config)

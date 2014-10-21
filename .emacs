;; set backup file directory
(setq backup-directory-alist
'(("." . "~/.emacs.bak")))

;; ignore print key
(global-set-key [print] 'ignore)

;; filetypes
(add-to-list 'auto-mode-alist
'("\\.purs\\'" . haskell-mode))

;; Marmalade package management
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

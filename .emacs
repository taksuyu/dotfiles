;; set backup file directory
(setq backup-directory-alist
      '(("." . "~/.emacs.bak")))

;; ignore print key
(global-set-key [print] 'ignore)

;; filetypes
(setq auto-mode-alist
      (append
       '(("\\.purs\\'" . haskell-mode)
	 ("\\.zsh\\'" . shell-script-mode))
       auto-mode-alist))

;; Marmalade package management
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(custom-set-variables
 '(inhibit-startup-screen t))

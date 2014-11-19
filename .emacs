;; set backup file directory
(setq backup-directory-alist
      '(("." . "~/.emacs.bak")))

;; ignore print key
(global-set-key [print] 'ignore)

;; flycheck toggle
(global-set-key (kbd "C-x \\") 'flycheck-mode)

;; filetypes
(setq auto-mode-alist
      (append
       '(("\\.purs\\'" . haskell-mode)
	 ("\\.zsh\\'" . shell-script-mode)
         ("\\.install\\'" . shell-script-mode)
	 ("PKGBUILD\\.*\\'" . shell-script-mode))
       auto-mode-alist))

;; package management
(require 'package)
(setq package-archives
      (append
       '(("marmalade" . "http://marmalade-repo.org/packages/")
	 ("melpa-stable" . "http://stable.melpa.org/packages/"))
       package-archives))
(package-initialize)

;; tweaks
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-font-lock-haddock nil)
 '(haskell-font-lock-symbols nil)
 '(haskell-indent-spaces 2)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(haskell-program-name "cabal repl")
 '(haskell-stylish-on-save t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Package management should be enabled
(when (>= emacs-major-version 24)
  (require 'package)
  (setq 'package-archives
	(append '(("org"       . "http://orgmode.org/elpa/")
		  ("melpa"     . "http://melpa.milkbox.net/packages/")
		  ("marmalade" . "http://marmalade-repo.org/packages/")
		 )
		package-archives))
  (package-initialize)

  (setq package-list '(flycheck-haskell
		       ghc
		       haskell-mode
		       magit
		       markdown-mode
		       purescript-mode
		       python-mode
		       shakespeare-mode
		       ))

  (when (not package-archive-contents)
    (package-refresh-contents))

  (dolist (package package-list)
    (when (not (package-install-p package))
      (package-install package)))
  
;; set backup file directory which prevents the filesystem being
;; polluted with #file#
(setq backup-directory-alist '(("." . "~/.emacs.bak")))

;; exec-path
(setq exec-path (append exec-path '("~/.cabal/bin/")))

(global-set-key [print] 'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(inhibit-startup-screen t)
 '(purescript-mode-hook (quote (turn-on-purescript-indentation)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;
;; Here be dragons. ;;
;;;;;;;;;;;;;;;;;;;;;;


;; flycheck toggle
(global-set-key (kbd "C-x \\") 'flycheck-mode)

;; filetypes
(setq auto-mode-alist
      (append
       '(("\\.zsh\\'" . shell-script-mode)
         ("\\.install\\'" . shell-script-mode)
	 ("PKGBUILD\\.*\\'" . shell-script-mode)
	 ("\\.md\\'" . markdown-mode))
       auto-mode-alist))

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-hi2)

(eval-after-load 'haskell-mode
  '(progn				  
     (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile)
     (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

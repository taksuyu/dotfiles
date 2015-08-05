;; Package management should be enabled
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives
	(append '(("org"       . "http://orgmode.org/elpa/")
		  ("melpa"     . "http://melpa.milkbox.net/packages/")
		  ("marmalade" . "http://marmalade-repo.org/packages/")
		 )
		package-archives))

  (package-initialize)

  ;; List of packages in use
  (setq package-list '(ensime
                       flycheck-haskell
		       ghc
		       haskell-mode
		       js2-mode
		       magit
		       markdown-mode
		       purescript-mode
		       python-mode
                       rust-mode
		       shakespeare-mode
		       ))

  (when (not package-archive-contents)
    (package-refresh-contents))

  ;; Taken from bitemyapp
  ;; https://github.com/bitemyapp/dotfiles/blob/master/.emacs
  ;;
  ;; Install anything that isn't
  (dolist (package package-list)
    (when (not (package-installed-p package))
      (package-install package)))

) ;; end package management
  
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
 '(indent-tabs-mode nil)
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

;; editing
(defun insert-newline-after ()
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))
(global-set-key (kbd "<C-return>") 'insert-newline-after)

(defun insert-newline-above ()
  (interactive)
  (let ((oldpos (point)))
    (previous-line)
    (end-of-line)
    (newline-and-indent)))
(global-set-key (kbd "<S-return>") 'insert-newline-above)

;; magit keys
(require 'magit)
(global-set-key (kbd "C-c m s") 'magit-status)
(setq magit-last-seen-setup-instructions "1.4.0")

;; flycheck toggle
(require 'flycheck)
(global-set-key (kbd "C-x \\") 'flycheck-mode)

;; filetypes
(setq auto-mode-alist
      (append
       '(("\\.zsh\\'"       . shell-script-mode)
         ("\\.install\\'"   . shell-script-mode)
	 ("PKGBUILD\\.*\\'" . shell-script-mode)
	 ("\\.md\\'"        . markdown-mode)
	 (".js"             . js2-mode))
       auto-mode-alist))

;; haskell
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;(add-hook 'haskell-mode-hook 'turn-on-hi2)

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

;; Scala
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

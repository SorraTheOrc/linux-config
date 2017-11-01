(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'bind-key)

;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
		    ("org" . "http://orgmode.org/elpa/")
		    ("melpa" . "http://melpa.org/packages/")
		    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Install / Configure Packages

(use-package markdown-mode
	     :ensure t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	       :init (setq markdown-command "multimarkdown"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package ensime
  :ensure t
  :pin melpa-stable)

(use-package python-environment
  :ensure t)

(use-package zoom-window
  :ensure t)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)

(use-package dockerfile-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(use-package yasnippet
  :ensure t)

(use-package bash-completion
  :ensure t)
(bash-completion-setup)

(use-package minimap
  :ensure t)
(setq minimap-update-delay 0.9)
(setq minimap-window-location 'right)
(setq minimap-recenter-type "free")

(use-package auto-complete
  :ensure t)

(use-package auto-complete-config
  :ensure t)
(global-auto-complete-mode t)
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(use-package highlight-indentation
  :ensure t)
(add-hook 'go-mode-hook
	  (lambda ()
	    (highlight-indentation-current-column-mode)
	    )
	  )
(set-face-background 'highlight-indentation-current-column-face "DarkSlateBlue")


(use-package smartparens
  :ensure t
  :config
  (setq sp-show-pair-from-inside nil)
  (require 'smartparens-config)
    :diminish smartparens-mode)
(sp-pair "(" nil :unless '(sp-point-before-word-p))
(sp-pair "[" nil :unless '(sp-point-before-word-p))
(sp-pair "{" nil :unless '(sp-point-before-word-p))

(progn
  ;; make indentation commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
)

(provide 'init)

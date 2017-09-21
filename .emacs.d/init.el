(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'bind-key)
(require 'use-package)

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)
(package-initialize)

(use-package markdown-mode
	     :ensure t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	       :init (setq markdown-command "multimarkdown"))

(use-package ensime
  :ensure t)

(mapc
 (lambda (package)
   (or (package-installed-p package)
              (if (y-or-n-p (format "Package %s is missing.  Install it? " package))
		  (package-install package))))
 '

 (bash-completion flycheck go-autocomplete go-direx direx
  go-eldoc go-mode go-snippets highlight-indentation
  python-environment smartparens 
  auto-complete yasnippet zoom-window minimap
  dockerfile-mode)
)

(require 'zoom-window)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(require 'yasnippet)
(yas-global-mode 1)

(require 'bash-completion)
(bash-completion-setup)

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'minimap)
(setq minimap-update-delay 0.9)
(setq minimap-window-location 'right)
(setq minimap-recenter-type "free")

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(require 'highlight-indentation)
(add-hook 'go-mode-hook
	  (lambda ()
	    (highlight-indentation-current-column-mode)
	    )
	  )
(set-face-background 'highlight-indentation-current-column-face "DarkSlateBlue")

(declare-function sp-insert-pair "smartparens.el" nil)
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
	       (sp-local-pair "<" ">")
	       (sp-local-pair "<%" "%>"))
(custom-set-faces
 '(sp-show-pair-match-face ((t (:background "grey75" :foreground "darkslateblue" :inverse-video
					     t))) nil "Changing weird sp match face highlight color for
 console mode"))

(require 'go-autocomplete)

(require 'go-direx)
(global-set-key (kbd "C-x C-j") 'go-direx-pop-to-buffer)

(progn
  ;; make indentation commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
)

(provide 'init)

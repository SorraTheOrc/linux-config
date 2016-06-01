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

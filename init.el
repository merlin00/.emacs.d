(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(package-refresh-contents)
 
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(push "~/.emacs.d/lisp" load-path)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/org-cfg/emacs-cfg.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
<<<<<<< HEAD
	 (quote
		(ob-ipython ein jedi elpy yasnippet flycheck exec-path-from-shell org-plus-contrib which-key use-package try swiper-helm ox-reveal org-bullets magit iedit color-theme-solarized ace-window ac-ispell))))
=======
   (quote
    (elpy htmlize yasnippet which-key use-package try solarized-theme pyvenv ox-reveal org-plus-contrib org-bullets magit jedi iedit highlight-indentation helm flycheck find-file-in-project exec-path-from-shell counsel company anaconda-mode ace-window))))
>>>>>>> parent of 9604cd3... deleted anaconda mode.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

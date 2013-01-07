(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("d7d93e97f7d5cfc158734a40c672391671800a5bae8a02e9730e88312defbbb2" default)))
 '(custom-theme-load-path (quote (custom-theme-directory t "~\\Dropbox\\Apps\\emacs_custom\\themes")))
 '(fci-rule-color "#383838")
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil)
)

;;ibuffer
    (global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)

;;set default directory = ~
(cd "~/")

;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;Darkroom mode
(add-to-list 'load-path "~/Dropbox/Apps/emacs_akarin/elisp/darkroom")
(require 'darkroom-mode)

;;org-mode
(global-set-key  "\C-x\ \C-o" 'org-mode)

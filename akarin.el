(setq my-el-dir "~/tmp/akarin.d")

(add-to-list 'load-path  (expand-file-name "vendor" my-el-dir))

(setq custom-file (expand-file-name "rmm5t/custom.el" my-el-dir))
(load custom-file 'noerror)

(load "rmm5t/akarin-personal")
(load "rmm5t/theme")
(load "rmm5t/global")
(load "rmm5t/defuns")
(load "rmm5t/bindings")
(load "rmm5t/tabs")
(load "rmm5t/fonts")
(load "rmm5t/utf-8")
(load "rmm5t/scratch")
(load "rmm5t/diff")
(load "rmm5t/ido")
(load "rmm5t/dired")
(load "rmm5t/recentf")
(load "rmm5t/org")
(load "rmm5t/zoom")
(load "rmm5t/magit")


;; (load "rmm5t/transparent")
(load "rmm5t/hl-line")
;; (load "rmm5t/iswitchb")

(vendor 'smex)
(vendor 'ido-complete-space-or-hyphen)
(vendor 'akarin)
(vendor 'magit)
(vendor 'shell-pop)
(vendor 'browse-kill-ring)
(vendor 'undo-tree)
(vendor 'autopair)

;;auto-complete
;; (add-to-list 'load-path "~/.emacs.d/vendor/auto-complete"); This may not be appeared if you have already added.
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (vendor 'auto-complete)
;; (add-to-list 'ac-dictionary-directories (expand-file-name "vendor/auto-complete/ac-dict"))

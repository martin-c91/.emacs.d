(add-to-list 'load-path  "~/.emacs.d/vendor")

(setq custom-file "~/.emacs.d/rmm5t/custom.el")
(load custom-file 'noerror)

(load "rmm5t/theme")
(load "rmm5t/global")
(load "rmm5t/defuns")
(load "rmm5t/bindings")
(load "rmm5t/tabs")
(load "rmm5t/fonts")
(load "rmm5t/utf-8")
(load "rmm5t/scratch")
;;(load "rmm5t/grep")
;; (load "rmm5t/diff")
(load "rmm5t/ido")
(load "rmm5t/dired")
(load "rmm5t/recentf")
;; (load "rmm5t/rectangle")
;; (load "rmm5t/org")
;; (load "rmm5t/zoom")
;; (load "rmm5t/flymake")
;; (load "rmm5t/javascript")
;; (load "rmm5t/ri-emacs")
;; (load "rmm5t/mac")
;; (load "rmm5t/server-mode")
;; (load "rmm5t/shell-mode")
;; (load "rmm5t/private" 'noerror)
;;(load "rmm5t/transparent")

;; (load "rmm5t/hl-line")
;; (load "rmm5t/iswitchb")

;;Smex
(load "rmm5t/smex")

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete"); This may not be appeared if you have already added.
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/ac-dict")
;;popup
(require 'popup)

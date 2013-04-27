;; Need this to load after vendor() it.
(vendor 'popup)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

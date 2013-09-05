;;; org-mode

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)

;; (setq org-agenda-files (list "~/org/home.org"
;;                              "~/org/inbox.org"
;;                              "~/org/emacsbook.org"))

(setq org-agenda-files (list "~/dropbox/todo.org"))

(global-set-key (kbd "C-c r") 'remember)
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(setq org-remember-templates
       '((?n "* %U %?" "~/dropbox/inbox.org")))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))

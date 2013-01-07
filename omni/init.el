;; Org Mode
(setq load-path (cons "~/Dev/dist/org-mode/lisp" load-path))
(setq load-path (cons "~/Dev/dist/org-mode/contrib/lisp" load-path))
(add-to-list 'Info-default-directory-list
             (expand-file-name "~/Dev/dist/org-mode/doc"))
(require 'org)
(require 'org-faces)
(require 'org-protocol)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-directory "~/Dev/scm/github.jeapostrophe/home/etc/")
(setq org-bookmarks-file "~/Dev/scm/github.jeapostrophe/home/etc/bookmarks.org")
(setq org-default-notes-file "~/Dev/scm/github.jeapostrophe/home/etc/brain.org")
(setq org-agenda-files (list org-directory))

(defun je/org-open-bookmarks ()
  "Open bookmark file"
  (interactive)
  (find-file org-bookmarks-file))
(defun je/org-archive-all ()
  "Archive everything that is done"
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(global-set-key (kbd "s-t")
                (lambda ()
                  (interactive)
                  (if (eq major-mode 'org-mode)
                      (org-todo)
                    (progn
                      (org-agenda-todo)
                      ;; XXX I added this because sometimes it would
                      ;; check the same one twice, but this feels slow
                      ;; and hacky
                      (je/todo-list)))))

(org-defkey org-mode-map [(meta tab)]  nil)

(org-defkey org-mode-map (kbd "s-[") 'org-metaleft)
(org-defkey org-mode-map (kbd "s-]") 'org-metaright)
(org-defkey org-mode-map (kbd "s-{") 'org-shiftleft)
(org-defkey org-mode-map (kbd "s-}") 'org-shiftright)

(org-defkey org-mode-map [(meta left)]  nil)
(org-defkey org-mode-map [(meta right)] nil)
(org-defkey org-mode-map [(shift meta left)]  nil)
(org-defkey org-mode-map [(shift meta right)] nil)
(org-defkey org-mode-map [(shift up)]          nil)
(org-defkey org-mode-map [(shift down)]        nil)
(org-defkey org-mode-map [(shift left)]        nil)
(org-defkey org-mode-map [(shift right)]       nil)

(setq org-hide-leading-stars t)
(setq org-return-follows-link t)
(setq org-completion-use-ido t)
(setq org-log-done t)
(setq org-clock-modeline-total 'current)
(setq org-support-shift-select t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-include-diary nil)
(setq org-agenda-remove-tags t)
(setq org-agenda-restore-windows-after-quit t)
(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks t)
(setq org-agenda-repeating-timestamp-show-all t)
(setq org-agenda-show-all-dates t)
(setq org-timeline-show-empty-dates nil)
(setq org-ctrl-k-protect-subtree t)
(setq org-use-property-inheritance nil)
(setq org-agenda-todo-keyword-format "")

(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps t)
(setq org-refile-targets `((nil . (:maxlevel . 20))))
;; This ensures that headings are not refile targets if they do not
;; already have children.
(defun je/has-children ()
  (save-excursion
    (let ((this-level (funcall outline-level)))
      (outline-next-heading)
      (let ((child-level (funcall outline-level)))
        (> child-level this-level)))))
(setq org-refile-target-verify-function 'je/has-children)

(setq org-agenda-todo-ignore-scheduled 'future)
;; Doesn't have an effect in todo mode
;;(setq org-agenda-ndays 365)

;; XXX Make some more for getting %x, %a, and %i
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  SCHEDULED: %T\tDEADLINE: %T\n%a")
        ("u" "URL" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  SCHEDULED: %T\tDEADLINE: %T\n  %a\n %i")
        ("b" "Bookmark" entry (file+headline org-bookmarks-file "To Parse")
         "* %a\n  %i"
         :immediate-finish t)))

(global-set-key
 (kbd "<s-f1>")
 (lambda () (interactive) (org-capture nil "t")))
(global-set-key
 (kbd "<s-XF86MonBrightnessDown>")
 (lambda () (interactive) (org-capture nil "t")))

(setq org-agenda-before-sorting-filter-function 'je/todo-color)
(setq org-agenda-cmp-user-defined 'je/agenda-sort)
(setq org-agenda-sorting-strategy '(user-defined-up))
(setq org-agenda-overriding-columns-format "%56ITEM %DEADLINE")
(setq org-agenda-overriding-header "")

(setq org-agenda-custom-commands
      '(("t" "Todo list" todo "TODO"
         ())))

(add-hook 'org-finalize-agenda-hook
    (lambda ()
      (remove-text-properties
       (point-min) (point-max) '(mouse-face t))))

;;; These are the default colours from OmniFocus
(defface je/due
  (org-compatible-face 'default
    '((t (:foreground "#000000"))))
  "Face for due items"
  :group 'org-faces)
(set-face-foreground 'je/due "#dc322f")

(defface je/today
  (org-compatible-face 'default
    '((t (:foreground "#000000"))))
  "Face for today items"
  :group 'org-faces)
(set-face-foreground 'je/today "#cb4b16")

(defface je/soon
  (org-compatible-face 'default
    '((t (:foreground "#000000"))))
  "Face for soon items"
  :group 'org-faces)
(set-face-foreground 'je/soon "#859900")

(defface je/near
  (org-compatible-face 'default
    '((t (:foreground "#000000"))))
  "Face for near items"
  :group 'org-faces)
(set-face-foreground 'je/near "#6c71c4")

(defface je/normal
  (org-compatible-face 'default
    '((t (:foreground "#000000"))))
  "Face for normal items"
  :group 'org-faces)
(set-face-foreground 'je/normal "#657b83")

(defface je/distant
  (org-compatible-face 'default
    '((t (:foreground "#000000"))))
  "Face for distant items"
  :group 'org-faces)
(set-face-foreground 'je/distant "#93a1a1")

(defvar je-schedule-flag? t)
(setq je-schedule-flag? t)
(defun je/todo-color (a)
  "Color things in the column view differently based on deadline"
  (let* ((ma (or (get-text-property 1 'org-marker a)
                 (get-text-property 1 'org-hd-marker a)))
         (tn (org-float-time (org-current-time)))

         (sa (org-entry-get ma "SCHEDULED"))
         (da (org-entry-get ma "DEADLINE"))

         (ta (if da (org-time-string-to-seconds da) 1.0e+INF))
         (a-day (if da (time-to-days (seconds-to-time ta)) 0))
         (sta (if sa (org-time-string-to-seconds sa) 0)))

    ;; Remove the TODO
    ;; use  (setq org-agenda-todo-keyword-format "") instead?
    (put-text-property
     0 (length a)
     'txt
     (replace-regexp-in-string "^TODO *" "" (get-text-property 0 'txt a))
     a)

    ;; Remove the old face
    (remove-text-properties
       0 (length a) '((face nil) (fontified nil)) a)

    ;; Put on the new face
    (put-text-property
     0 (length a)
     'face
     (cond
      ((< ta tn)
       ;; The deadline has passed
       'je/due)
      ((= a-day (org-today))
       ;; The deadline is today
       'je/today)
      ((< ta (+ tn (* 60 60 24)))
       ;; The deadline is in the next day
       'je/soon)
      ((< ta (+ tn (* 60 60 24 7)))
       ;; The deadline is in the next week
       'je/near)
      ((< ta (+ tn (* 60 60 24 7 4 )))
       ;; The deadline is in the next four weeks
       'je/normal)
      (t
       'je/distant))
     a)

    (if (and je-schedule-flag? (< tn sta))
        nil
      a)))

(defun je/todo-list ()
  "Open up the org-mode todo list"
  (interactive)

  (progn
    (org-agenda "" "t")
    (org-agenda-columns)))

(global-set-key (kbd "s-o") 'je/todo-list)

(defun je/agenda-sort (a b)
  "Sorting strategy for agenda items."
  (let* ((ma (or (get-text-property 1 'org-marker a)
                 (get-text-property 1 'org-hd-marker a)))
         (mb (or (get-text-property 1 'org-marker b)
                 (get-text-property 1 'org-hd-marker b)))
         (def 1.0e+INF)
         (da (org-entry-get ma "DEADLINE"))
         (ta (if da (org-time-string-to-seconds da) def))
         (db (org-entry-get mb "DEADLINE"))
         (tb (if db (org-time-string-to-seconds db) def)))
    (cond ((< ta tb) -1)
          ((< tb ta) +1)
          (t nil))))

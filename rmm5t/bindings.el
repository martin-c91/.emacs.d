;;; Global key bindigns

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

;; Window manipulation
;; (global-set-key [(control kp-6)] 'enlarge-window-horizontally)
;; (global-set-key [(control kp-4)] 'shrink-window-horizontally)
;; (global-set-key [(control kp-8)] 'enlarge-window)
;; (global-set-key [(control kp-2)] 'shrink-window)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Find stuff
(global-set-key [(f2)]              'ack-default-directory)
(global-set-key [(control f2)]      'ack-same)
(global-set-key [(control meta f2)] 'ack)
(global-set-key [(meta f2)]         'find-name-dired)
(global-set-key [(shift f2)]        'occur)

;; Keyboard macros
;; (global-set-key [(shift f4)] 'kmacro-start-macro-or-insert-counter)
;; (global-set-key [(f4)]    'kmacro-end-or-call-macro)  ;; already defined

;; Refresh-like
(global-set-key [(control f5)]         'revert-buffer)


;; Indenting and alignment
;;(global-set-key [(f8)]         'indent-region)
;;(global-set-key [(control f8)] 'align)
;;(global-set-key [(shift f8)]   'align-current)
;;(global-set-key [(meta f8)]    'align-regexp)

;; Version control and change related
;(global-set-key [(control f9)]      'rails-svn-status-into-root)  ;; Move to rails mode?
;(global-set-key [(control meta f9)] (lambda () (interactive) (svn-status default-directory)))
(global-set-key [(control f9)] (lambda () (interactive) (magit-status default-directory)))
(global-set-key [(f9)]         (lambda () (interactive) (magit-status default-directory)))
(global-set-key [(meta f9)]    'autotest-switch)  ;; Move to ruby/rails mode?

;; map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap

(global-set-key (kbd "M-O") 'rotate-windows)

;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window
;; To help Unlearn C-x 0, 1, 2, o
(global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
(global-unset-key (kbd "C-x 2")) ; was split-window-vertically
(global-unset-key (kbd "C-x 1")) ; was delete-other-windows
(global-unset-key (kbd "C-x 0")) ; was delete-window
(global-unset-key (kbd "C-x o")) ; was other-window

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Window navigation
(windmove-default-keybindings 'meta)

;; Mac OS X conventions
;;(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; Easy inserts
;;(global-set-key (kbd "C-.") 'insert-arrow)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Easier buffer killing
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'kill-this-buffer)


;; Personal textmate.el bindings
(global-set-key (kbd "C-c f") 'textmate-goto-file)
(global-set-key [(control return)] 'textmate-next-line)

;; Tags
(global-set-key (kbd "M-,") 'pop-tag-mark) ; was tags-loop-continue

;; Recentf key
(global-set-key (kbd "C-x f") 'recentf-open-files)

;; Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;undo-tree
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-/") 'undo) ;
(global-set-key (kbd "C-?") 'redo) ;

;;shell shortcut
(global-set-key (kbd "C-c C-s") 'eshell) ;
(global-set-key (kbd "C-c C-S-s") 'eshell-command) ;

;; Quickly jump in document with ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-;") 'ace-jump-mode)

;; Browse the kill ring
(global-set-key (kbd "C-x y") 'browse-kill-ring)

;; eval-buffer
(global-set-key [(f5)] 'eval-buffer)

;; Move current line up or down
;;(global-set-key [(control shift up)]  'move-line-up)
;;(global-set-key [(control shift down)]  'move-line-down)
;;(global-set-key [(meta shift up)]  'move-line-up)
;;(global-set-key [(meta shift down)]  'move-line-down)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Disable C-x C-c
(global-unset-key (kbd "C-x C-c"))

;;Transparent windows. Unknown author
(defun transparent(alpha-level no-focus-alpha-level)
 "Let's you make the window transparent"
 (interactive "nAlpha level (0-100): \nnNo focus alpha level (0-100): ")
 (set-frame-parameter (selected-frame) 'alpha (list alpha-level no-focus-alpha-level))
 (add-to-list 'default-frame-alist `(alpha ,alpha-level)))

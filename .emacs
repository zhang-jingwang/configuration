;; Turn on semantic highlight.
(global-font-lock-mode t)
;; Configure auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;; Create my personal style.
(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)
;; Add linux kernel coding style
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))
(c-add-style "linux-tabs-only" '("linux" (c-offsets-alist
					  (arglist-cont-nonempty
					   c-lineup-gcc-asm-reg
					   c-lineup-arglist-tabs-only))))
;; Add c-mode hook to choose the right coding style.
(defun my-c-mode-common-hook ()
  (let ((filename (buffer-file-name)))
    ;; Enable kernel mode for the appropriate files
    (if (and filename
	       (string-match (expand-file-name "~/src/linux")
			     filename))
      (progn (setq indent-tabs-mode t)
	     (c-set-style "linux-tabs-only"))
      (progn (c-set-style "PERSONAL")
	     (setq tab-width 4 indent-tabs-mode nil))
    )))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Configure cscope
(require 'xcscope)
(cscope-setup)
(setq cscope-do-not-update-database t)

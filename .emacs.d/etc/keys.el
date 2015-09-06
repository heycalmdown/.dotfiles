;; # etc

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (define-key emacs-lisp-mode-map 
	      "\C-c\C-c" 
	      'eval-defun)))

(add-hook 'lisp-interaction-mode-hook
	  (lambda ()
	    (define-key lisp-interaction-mode-map 
	      "\C-c\C-c" 
	      'eval-defun)))

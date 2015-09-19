(add-to-list 'load-path "~/.emacs.d/etc/")
(load-library "melpa")
(load-library "style")
(load-library "keys")
(load-library "plugins")

(setq-default indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/.saves"))))
 '(js-indent-level 2)
 '(p4-executable "~/Documents/bin/p4")
 '(show-trailing-whitespace t)
 '(typescript-indent-level 2))

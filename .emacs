;; emacs has a bad habit of trying to edit
;; config files without permission...
(setq custom-file "~/.emacs.custom.el")
(load-file custom-file)


;; to be fair I have no idea
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


;; why were they there in the first place???
(setq inhibit-splash-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
;; (global-display-line-numbers)


;; ease of mind
(global-set-key (kbd "C-M-p") 'windmove-up)
(global-set-key (kbd "C-M-n") 'windmove-down)
(global-set-key (kbd "C-M-b") 'windmove-left)
(global-set-key (kbd "C-M-f") 'windmove-right)

(ido-mode 1) ;; interactive C- commands


;; font and colorsche
(set-frame-font "BigBlueTerm437 Nerd Font 12" nil t)
(load-theme 'gruber-darker)

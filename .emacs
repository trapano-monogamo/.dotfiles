(package-initialize)

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


(setq inhibit-splash-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; (windmove-default-keybindings)

(global-set-key (kbd "C-M-p") 'windmove-up)
(global-set-key (kbd "C-M-n") 'windmove-down)
(global-set-key (kbd "C-M-b") 'windmove-left)
(global-set-key (kbd "C-M-f") 'windmove-right)

;; (load-theme 'gruber-darker)
(load-theme 'modus-vivendi)

(ido-mode 1) ;; interactive C- commands

;; -*- coding: utf-8; lexical-binding: t; -*-

;; {{ Magit
(global-set-key (kbd "C-x g") 'magit-status)
;; }}

;; {{ Custom project jump
(global-set-key (kbd "C-x ²")
                (lambda()
                  (interactive)
                  (dired "~/.emacs.d")))

(global-set-key (kbd "C-x &")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware")))

(global-set-key (kbd "C-x C-&")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo")))

(global-set-key (kbd "C-x é")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/modules")))

(global-set-key (kbd "C-x \"")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/project/main02")))

(global-set-key (kbd "C-x '")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/modules/includes")))

(global-set-key (kbd "C-x (")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/tools")))

(global-set-key (kbd "C-x -")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/external")))

(global-set-key (kbd "C-M-i")
                (lambda()
                  (interactive)
				  (idle-highlight-mode)))

;; }}

;; {{ Custom project jump
(global-set-key (kbd "C-x è")
                (lambda()
                  (interactive)
                  (find-file "~/.organistation.org")))
;; }}

;; {{ Makefile mode for custom makefile extensions
(setq auto-mode-alist
      (cons '("\\.inc\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.docker\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.release\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.gen\\'" . makefile-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.proto\\'" . protobuf-mode) auto-mode-alist))
;; }}

(provide 'init-custom-keybindings)
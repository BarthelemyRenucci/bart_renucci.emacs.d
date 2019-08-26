;; -*- coding: utf-8; lexical-binding: t; -*-


;; {{ Modified C-h to delete
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
;; }}

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
      (cons '("\\.proto\\'" . protobuf-mode) auto-mode-alist))
;; }}

(provide 'init-custom-keybindings)
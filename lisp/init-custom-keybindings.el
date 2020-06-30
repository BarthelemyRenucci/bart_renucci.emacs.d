;; -*- coding: utf-8; lexical-binding: t; -*-

;; {{ Magit
(global-set-key (kbd "C-x g") 'magit-status)
;; }}

;; {{ Custom project jump
(global-set-key (kbd "C-x ²")
                (lambda()
                  (interactive)
                  (dired "~/.emacs.d")))

(global-set-key (kbd "C-x C-²")
                (lambda()
                  (interactive)
                  (dired "~/misc")))

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

(global-set-key (kbd "C-x C-\"")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/project/zoovbox01")))


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

;; {{ Magit d for both ediff
(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)
;; }}

;; {{ Add search at point for swiper
(global-set-key (kbd "C-M-u") (lambda () (interactive) (swiper-thing-at-point)))
;; }}

;; {{ Shell cmd

(global-set-key (kbd "C-c m") (lambda () (interactive) (shell-command "cd ~/birota-repo/embedded-firmware/project/main02 && make flash -j &")))

(global-set-key (kbd "C-c !") (lambda () (interactive) (shell-command "make -j &")))

(global-set-key (kbd "C-c g") (lambda () (interactive) (shell-command "git submodule update --init &")))

(global-set-key (kbd "C-c p") (lambda () (interactive) (shell-command (format "autopep8 -i %s" (thing-at-point 'filename)))))

;; }}

(provide 'init-custom-keybindings)

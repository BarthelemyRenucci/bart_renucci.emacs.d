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
                  (dired "~/birota-repo/embedded-firmware/project")))

(global-set-key (kbd "C-x C-\"")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/project/edock01-main")))


(global-set-key (kbd "C-x '")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/modules/includes")))

(global-set-key (kbd "C-x (")
                (lambda()
                  (interactive)
                  (dired "~/birota-repo/embedded-firmware/tools")))

(global-set-key (kbd "C-x C-(")
                (lambda()
                  (interactive)
                  (dired "/home/bart/birota-repo/embedded-rd-logs-viewer/")))

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

(global-set-key (kbd "C-x C-è")
                (lambda()
                  (interactive)
                  (find-file "~/.scratch.txt")))

(global-set-key (kbd "C-x à")
                (lambda()
                  (interactive)
                  (find-file "~/.emacs.d/.cheat_sheet.md")))

;; }}

;; {{ Makefile mode for custom makefile extensions
(setq auto-mode-alist
      (cons '("\\Makefile\\'" . makefile-mode) auto-mode-alist))
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
(setq auto-mode-alist
      (cons '("\\.remote\\'" . protobuf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.jlink\\'" . protobuf-mode) auto-mode-alist))
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

(global-set-key (kbd "C-c g") (lambda () (interactive) (shell-command "git submodule update --init --recursive &")))

(global-set-key (kbd "C-c p") (lambda () (interactive) (shell-command (format "autopep8 -i %s" (thing-at-point 'filename)))))

;; }}

;; {{ Browse Kill ring
(global-set-key (kbd "C-M-y") (lambda() (interactive) (browse-kill-ring)))
;; }}

;; {{ Incremant yank
(defun dlh-increment-string (string)
  (setq start (string-match "\\([0-9]+\\)" string))
  (setq end (match-end 0))
  (setq number (string-to-number (substring string start end)))
  (setq new-num-string (number-to-string (+ 1 number)))
  (concat
   (substring string 0 start)
   new-num-string
   (substring string end)))

(defun dlh-yank-increment ()
  "Yank text, incrementing the first integer found in it."
  (interactive "*")
  (setq new-text (dlh-increment-string (current-kill 0)))
  (insert-for-yank new-text)
  (kill-new new-text t))

(global-set-key (kbd "C-c C-u") 'dlh-yank-increment)
;; }}

;; {{ Copy at point

(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point))

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "Copy thing between beg & end into kill ring."
  (save-excursion
	(let ((beg (get-point begin-of-thing 1))
		  (end (get-point end-of-thing arg)))
	  (copy-region-as-kill beg end))))

(defun paste-to-mark (&optional arg)
  "Paste things to mark, or to the prompt in shell-mode."
  (unless (eq arg 1)
	(if (string= "shell-mode" major-mode)
		(comint-next-prompt 25535)
	  (goto-char (mark)))
	(yank)))

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  ;;(paste-to-mark arg)
  )

(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (copy-thing 'beginning-of-line 'end-of-line arg)
  ;;(paste-to-mark arg)
  )

(global-set-key (kbd "C-c w")         (quote copy-word))
(global-set-key (kbd "C-c l")         (quote copy-line))
;; }}


(provide 'init-custom-keybindings)

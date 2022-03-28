; -*- coding: utf-8; lexical-binding: t; -*-

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 4)))

(provide 'init-json-mode)

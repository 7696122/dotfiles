(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eldoc-echo-area-prefer-doc-buffer t)
 '(package-selected-packages '(eglot leetcode))
 '(safe-local-variable-values
   '((eval org-sbe "import")
     (denote-file-type . markdown-yaml)
     (eval setq denote-directory
      (expand-file-name "src/content/blog/" default-directory)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((comment-fill-column . 80)
     (eval org-babel-lob-ingest
      (org-roam-node-file/title "time"))
     (eval org-babel-lob-ingest
      (org-roam-node-file/title "termux"))
     (eval org-babel-lob-ingest
      (org-roam-node-file/title "한글"))
     (eval org-babel-lob-ingest
      (org-roam-node-file/title "C-h를 backspace로 사용하기"))
     (eval org-babel-lob-ingest
      (org-roam-node-file/title "dired"))
     (eval org-babel-lob-ingest
      (org-roam-node-file/title "ucs-normalize"))
     (eval defun org-roam-node-file/title
      (_title)
      (org-roam-node-file
       (org-roam-node-from-title-or-alias _title)))
     (eval org-babel-lob-ingest "~/org/roam/_main/20210725070445-termux.org")
     (eval org-sbe "import")
     (eval org-sbe "setup")
     (eval setq org-id-locations-file "~/org/.orgids"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))

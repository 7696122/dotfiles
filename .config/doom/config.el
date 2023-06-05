;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "7696122"
      user-mail-address "7696122@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `use-package!' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(normal-erase-is-backspace-mode +1)
(define-key key-translation-map [?\C-h] [?\C-?])
(setq +format-with-lsp t)
(setq org-roam-directory org-directory)

(setq default-input-method "korean-hangul")

(progn ;; https://stackoverflow.com/questions/25542097/emacs-evil-mode-how-to-change-insert-state-to-emacs-state-automatically
  (setq evil-disable-insert-state-bindings t)
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state))

(use-package! ts-comint
  :commands (run-ts)
  :config
  (add-hook 'typescript-mode-hook
            (lambda ()
              (local-set-key (kbd "C-x C-e") 'ts-send-last-sexp)
              (local-set-key (kbd "C-M-x") 'ts-send-last-sexp-and-go)
              (local-set-key (kbd "C-c b") 'ts-send-buffer)
              (local-set-key (kbd "C-c C-b") 'ts-send-buffer-and-go)
              (local-set-key (kbd "C-c l") 'ts-load-file-and-go))))

(use-package orderless
  :config
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package! company
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-insertion-on-trigger nil)
  )

(use-package! company-quickhelp
  :hook (company-mode . company-quickhelp-mode)
  :config
  (company-quickhelp-mode +1))

(use-package! company-quickhelp-terminal
  :hook (company-quickhelp-mode . company-quickhelp-terminal-mode))

(use-package! md-roam
  :config
  (add-to-list 'org-roam-file-extensions "md")

  (md-roam-mode +1) ; md-roam-mode must be active before org-roam-db-sync
  (setq md-roam-file-extension "md") ; default "md". Specify an extension such as "markdown"
  (org-roam-db-autosync-mode 1) ; autosync-mode triggers db-sync. md-roam-mode must be already active

  (add-to-list 'org-roam-capture-templates
               '("m" "Markdown" plain "" :target
                 (file+head "roam/${slug}.md"
                            "---\ntitle: ${title}\nid: %<%Y-%m-%dT%H%M%S>\ncategory: \n---\n")
                 :unnarrowed t))

  (with-eval-after-load 'markdown-mode
    (advice-add #'markdown-indent-line
                :before-until #'completion-at-point)))

(use-package! highlight-parentheses
  :custom
  (highlight-parentheses-colors `(nil))
  (highlight-parentheses-highlight-adjacent t)

  :custom-face
  (highlight-parentheses-highlight
   ((t
     (
      :underline t
      :weight bold
      :inverse-video nil
      ))))

  :config
  (global-highlight-parentheses-mode +1))

(use-package! mouse
  :unless window-system
  :bind
  ("<mouse-4>" . scroll-down-line)
  ("<mouse-5>" . scroll-up-line)
  :config
  ;; (setq mouse-wheel-tilt-scroll t)
  (xterm-mouse-mode 1)
  (setq track-mouse nil)
  ;; (defun track-mouse (e))
  (setq mouse-sel-mode t)

  (mouse-wheel-mode))

(use-package! good-scroll
  :config
  (good-scroll-mode +1))

(use-package! page-break-lines
  :commands
  (global-page-break-lines-mode
   page-break-lines-mode)
  :hook
  (after-init . global-page-break-lines-mode))

(use-package! term-cursor
  :config
  (term-cursor-mode +1))

(use-package! eldoc
  :config
  (setq eldoc-idle-delay 0.5)
  (setq eldoc-print-after-edit nil)

  (eldoc-add-command-completions "company-"))

(use-package! web-mode
  :init
  (define-derived-mode astro-mode web-mode "Astro")
  ;; (setq auto-mode-alist
  ;;       (append '((".*\\.astro\\'" . astro-mode))
  ;;               auto-mode-alist))
  :mode
  (;; "\\.astro\\'"
   ("\\.astro$" . astro-mode))
  :hook
  (astro-mode . lsp)
  :custom
  ((web-mode-comment-style 2)
   (web-mode-comment-prefixing nil)
   (web-mode-enable-comment-annotation t)
   (web-mode-enable-comment-interpolation t)
   (web-mode-enable-engine-detection t)
   (web-mode-comments-invisible t)
   ))

;; (use-package markdown-mode
;;   :mode (("README\\.md$" . gfm-mode)
;;          ("\\.md$" . markdown-mode)
;;          ("\\.mdx$" . markdown-mode)
;;          ("\\.astro$" . astro-mode)
;;          ("\\.markdown$" . markdown-mode))
;;   :bind
;;   (:repeat-map markdown-outline-repeat
;;                ("p" . markdown-outline-previous)
;;                ("n" . markdown-outline-next))
;;   :init
;;   (define-derived-mode astro-mode markdown-mode "Astro")
;;   :hook
;;   (astro-mode . lsp)
;;   (markdown-mode . turn-off-auto-fill))

;; (use-package! tree-sitter
;;   :init
;;   (defun my-font-lock ()
;;     "my font-lock setting"
;;     (setq-local global-font-lock-mode -1)
;;     (turn-on-font-lock)
;;     (setq-local font-lock-keywords nil))
;;   (defun flyspell-tree-sitter-face ()
;;     "set flyspell face"
;;     (setq-local flyspell-prog-text-faces '(tree-sitter-hl-face:comment
;;                                            tree-sitter-hl-face:string
;;                                            tree-sitter-hl-face:doc)))
;;   (global-font-lock-mode 1)
;;   :custom
;;   (tree-sitter-hl-use-font-lock-keywords nil)
;;   :hook
;;   (tree-sitter-after-on . flyspell-tree-sitter-face)
;;   (tree-sitter-after-on . tree-sitter-hl-mode)
;;   (go-mode . tree-sitter-mode)
;;   (sh-mode . tree-sitter-mode)
;;   (html-mode . tree-sitter-mode)
;;   (typescript-mode . tree-sitter-mode)
;;   (tsx-mode . tree-sitter-mode)
;;   (yaml-mode . tree-sitter-mode)
;;   (markdown-mode . tree-sitter-mode)
;;   (jsonian-mode . tree-sitter-mode)
;;   (emacs-lisp-mode . my-font-lock)
;;   (prisma-mode . my-font-lock)
;;   (vue-mode . my-font-lock)
;; )

;; https://merrick.luois.me/posts/better-tsx-support-in-doom-emacs
;; (use-package! tree-sitter
;;   :init
;;   (add-to-list 'load-path "/Users/mnml/.config/emacs/.local/straight/repos/elisp-tree-sitter/lisp")
;;   (add-to-list 'load-path "/Users/mnml/.config/emacs/.local/straight/repos/elisp-tree-sitter/langs")

;;   :when (bound-and-true-p module-file-suffix)
;;   :hook (prog-mode . tree-sitter-mode)
;;   :hook (tree-sitter-after-on . tree-sitter-hl-mode)
;;   :config
;;   (require 'tree-sitter-langs)
;;   (global-tree-sitter-mode)
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
;;   (defadvice! doom-tree-sitter-fail-gracefully-a (orig-fn &rest args)
;;     "Don't break with errors when current major mode lacks tree-sitter support."
;;     :around #'tree-sitter-mode
;;     (condition-case e
;;         (apply orig-fn args)
;;       (error
;;        (unless (string-match-p (concat "^Cannot find shared library\\|"
;;                                        "^No language registered\\|"
;;                                        "cannot open shared object file")
;;                                (error-message-string e))
;;          (signal (car e) (cadr e)))))))

(use-package! typescript-mode
  :mode ("\\.tsx\\'" . typescript-tsx-tree-sitter-mode)
  :config
  (setq typescript-indent-level 2)

  (define-derived-mode typescript-tsx-tree-sitter-mode typescript-mode "TypeScript TSX"
    (setq-local indent-line-function 'rjsx-indent-line))
  (add-hook! 'typescript-tsx-tree-sitter-mode-local-vars-hook
             #'+javascript-init-lsp-or-tide-maybe-h
             #'rjsx-minor-mode)
  (map! :map typescript-tsx-tree-sitter-mode-map
        "<" 'rjsx-electric-lt
        ">" 'rjsx-electric-gt)

  (defun typescript-tsx-tree-sitter-indent-line ()
    (if-let* ((col (typescript-tsx-tree-sitter--proper-indentation))
              (offset (- (current-column) (current-indentation))))
        (progn
          (indent-line-to col)
          (move-to-column (+ offset col)))
      (typescript-indent-line)))

  (defun typescript-tsx-tree-sitter--in-tsx (node-type parent-type)
    (--some? (s-starts-with? "jsx" it)
             (--map (format "%s" it) (list node-type parent-type))))

  (defun typescript-tsx-tree-sitter--proper-indentation ()
    (save-excursion
      (back-to-indentation)
      (-let* ((node (tree-sitter-node-at-point))
              (parent (tsc-get-parent node))
              (node-type (tsc-node-type node))
              (parent-type (tsc-node-type parent)))
        ;; only handles jsx related indention
        (when (typescript-tsx-tree-sitter--in-tsx node-type parent-type)
          ;; (message "current: %s" node-type)
          ;; (message "parent: %s" parent-type)
          (cond
           ((and (member node-type '("{" "}"))
                 (eq 'jsx_expression parent-type))
            (+ (cdr (tsc-node-start-point (tsc-get-parent parent))) typescript-indent-level))
           ((eq 'jsx_expression parent-type)
            nil)
           ((eq 'jsx_attribute parent-type)
            (+ (cdr (tsc-node-start-point (tsc-get-parent parent))) typescript-indent-level))
           ((eq 'jsx_expression node-type)
            (+ typescript-indent-level (cdr (tsc-node-start-point node))))
           ((member node-type '(">" "/"))
            (cdr (tsc-node-start-point parent)))
           ((eq 'jsx_closing_element parent-type)
            (cdr (tsc-node-start-point (tsc-get-parent parent))))
           ((eq 'jsx_self_closing_element parent-type)
            nil)
           ((eq 'jsx_self_closing_element node-type)
            (+ (cdr (tsc-node-start-point node)) typescript-indent-level))
           (t
            (+ (cdr (tsc-node-start-point parent)) typescript-indent-level))))))))

(after! tree-sitter
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-tree-sitter-mode . tsx)))

;; (use-package! eglot
;;   ;; :after (markdown-mode)
;;   :config
;;   (add-hook 'astro-mode-hook #'eglot-ensure)
;;   (add-to-list 'eglot-server-programs '(astro-mode "astro-ls" "--stdio"))
;;   )

(use-package! flycheck-eglot)

(use-package! magit
  :config
  (and (eq system-type 'darwin)
       (use-package! ucs-normalize)
       (setq magit-git-output-coding-system 'utf-8-hfs)))

;; (use-package! apheleia
;;   ;; :custom
;;   ;; ((apheleia-log-only-errors nil))
;;   :config
;;   (push '(prettier-astro
;;           . (npx "prettier"
;;                  ;; "--stdin-filepath"
;;                  filepath
;;                  "--parser astro"
;;                  (apheleia-formatters-js-indent "--use-tabs" "--tab-width")))
;;         apheleia-formatters)

;;   (add-hook 'before-save-hook (lambda () (apheleia-format-buffer (apheleia--get-formatters))))
;;   (apheleia-global-mode +1))

(use-package! denote
  ;; :custom
  ;; (denote-directory "~/org/pages")
  ;; :config
  ;; (defalias 'denote 'denote-open-or-create)
  )

(use-package! treemacs
  :config
  (setq-default
   doom-themes-treemacs-theme
   (if window-system
       (progn
         ;; "doom-colors"
         "doom-atom"
         )
     ;; "doom-colors"
     ;; "doom-atom"
     "Default"
     ))
  (treemacs-load-theme doom-themes-treemacs-theme))

(use-package! dired-hacks
  :config
  (use-package! dired-hacks-utils)
  (use-package! dired-filter)
  (use-package! dired-open)

  (use-package dired-rainbow
    :config
    (progn
      (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
      (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
      (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
      (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
      (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
      (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
      (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
      (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
      (dired-rainbow-define log "#c17d11" ("log"))
      (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
      (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
      (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
      (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
      (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
      (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
      (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
      (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
      (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
      (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
      (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")
      ))

  (use-package! dired-subtree
    ;; https://xenodium.com/drill-down-emacs-dired-with-dired-subtree/
    :config
    (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
    (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

  (use-package! dired-collapse)
  (use-package! dired-list)
  (use-package! dired-narrow)
  )


(use-package! dired
  :after dired-hacks
  :config
  (defadvice dired-readin
      (after dired-after-updating-hook first () activate)
    "Sort dired listings with directories first before adding marks."
    (let ((dired-details-internal-overlay-list  ()))
      (dired-utils-format-information-line-mode)
      (dired-collapse-mode)
      (dired-hide-details-mode)))

  ;; (progn
  ;;   ;; https://emacs.stackexchange.com/questions/27912/dired-sort-and-hide-by-default
  ;;   (add-hook 'dired-mode-hook
  ;;             (lambda ()
  ;;               (dired-hide-details-mode)
  ;;               ;; (dired-sort-toggle-or-edit)
  ;;               )))
  )


(use-package! websearch)

(use-package! org-roam
  :config
  (add-hook! 'after-save-hook
    (defun org-rename-to-new-title ()
      (when-let*
          ((old-file (buffer-file-name))
           (is-roam-file (org-roam-file-p old-file))
           (file-node (save-excursion
                        (goto-char 1)
                        (org-roam-node-at-point)))
           (file-name  (file-name-base (org-roam-node-file file-node)))
           (file-time  (or (and (string-match "\\`\\([0-9]\\{14\\}\\)-" file-name)
                                (concat (match-string 1 file-name) "-"))
                           ""))
           (slug (org-roam-node-slug file-node))
           (new-file (expand-file-name (concat file-time slug ".org")))
           (different-name? (not (string-equal old-file new-file))))

        (rename-buffer new-file)
        (rename-file old-file new-file)
        (set-visited-file-name new-file)
        (set-buffer-modified-p nil)))))

;; (use-package! lsp-bridge
;;   :config
;;   (global-lsp-bridge-mode))

(use-package! poly-markdown)

(use-package! lsp-tailwindcss
  :custom
  (lsp-tailwindcss-add-on-mode t)
  :config
  (add-to-list 'lsp-tailwindcss-major-modes 'astro-mode))

(use-package! css-eldoc
  :config
  (css-eldoc-enable))
(use-package! eldoc-box
  :config
  (eldoc-box-hover-mode)
  (eldoc-box-hover-at-point-mode)
  ;; (eldoc-box-help-at-point)
  )
(use-package! eldoc-eval
  :config
  (eldoc-in-minibuffer-mode 1))
(use-package! eldoc-overlay
  :config
  (eldoc-overlay-mode -1))

(use-package! lsp-mode
  :config
  (setq lsp-eldoc-render-all t))

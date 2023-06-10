;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)

(package! ts-comint)
;; (package! tern)
;; (package! tern-auto-complete)
;; (package! company-tern :recipe (:host github :repo "kevinushey/company-tern"))
;; (package! tern-context-coloring)

;; (package! corfu :recipe (:files (:defaults "extensions/*")))
;; (package! cape :recipe (:host github :repo "minad/cape"))
;; (package! corfu-terminal :recipe (:repo "https://codeberg.org/akib/emacs-corfu-terminal.git"))
;; (package! corfu-doc-terminal :recipe (:type git :repo "https://codeberg.org/akib/emacs-corfu-doc-terminal.git"))
;; (package! corfu-mouse :recipe (:repo "https://codeberg.org/akib/emacs-corfu-mouse.git"))

;; (package! company-box :recipe (:host github :repo "sebastiencs/company-box"))
;; (package! company-quickhelp)
;; (package! company-quickhelp-terminal)

(package! md-roam :recipe (:host github :repo "nobiot/md-roam"))

(package! highlight-parentheses)

(package! good-scroll)

(package! page-break-lines)

(package! orgstrap)

(package! term-cursor :recipe (:host github :repo "h0d/term-cursor.el"))

(package! poly-markdown)

(package! treesit-auto)

;; (package! eglot :recipe (:host github :repo "joaotavora/eglot"))

(package! flycheck-eglot)

;; (package! lsp-bridge
;;   :recipe (:host github :repo "manateelazycat/lsp-bridge"
;;            :files ("*.el" "*.py" "acm" "core" "langserver"
;;                    "multiserver" "resources")))

(package! web-mode :recipe (:host github :repo "fxbois/web-mode"))
(package! mmm-mode :recipe (:host github :repo "dgutov/mmm-mode"))

;; (package! apheleia :recipe (:host github :repo "radian-software/apheleia"))

(package! denote
  :recipe (:host github
           :repo "protesilaos/denote"))

(package! dired-hacks
  :recipe (:host github :repo "Fuco1/dired-hacks"
           :files ("*.el")))

(package! emacs-websearch
  :recipe (:repo "https://gitlab.com/xgqt/emacs-websearch/"
           :files ("*.el" "extras/*")))

;; (package! tree-sitter
;;   :ignore (null (bound-and-true-p module-file-suffix))
;;   :recipe (:host github
;;            :branch "master"
;;            :repo
;;            "emacs-tree-sitter/elisp-tree-sitter"
;;            ;; "tree-sitter/tree-sitter"
;;            ))

;; (package! tree-sitter-langs
;;   :ignore (null (bound-and-true-p module-file-suffix))
;;   :recipe (:host github
;;            :branch "master"
;;            :repo
;;            ;; "emacs-tree-sitter/tree-sitter-langs"
;;            "7696122/tree-sitter-langs"))

(package! lsp-tailwindcss
  :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))

(package! css-eldoc)
(package! eldoc-box)
(package! eldoc-eval)
(package! eldoc-overlay)

(package! httpcode)

(package! org-jira)

(package! sideline)
(package! sideline-flycheck)
(package! sideline-lsp)
(package! sideline-eldoc :recipe (:repo "git@github.com:ginqi7/sideline-eldoc.git"))
(package! sideline-color :recipe (:host github :repo "emacs-sideline/sideline-color"))
(package! sideline-blame :recipe (:host github :repo "emacs-sideline/sideline-blame"))

(package! zetteldesk
  :recipe
  (:host github :repo "Vidianos-Giannitsis/zetteldesk.el"
         ;; :files ("*.el")
         ))
(package! zetteldesk-kb)
(package! zetteldesk-ref)
(package! zetteldesk-info)
(package! zetteldesk-remark)

(package! inline-docs)

(package! eask :recipe (:host github :repo "emacs-eask/eask"))
(package! eask-mode :recipe (:host github :repo "emacs-eask/eask-mode"))
(package! feature-mode)

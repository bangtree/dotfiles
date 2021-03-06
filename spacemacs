;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     clojure
     common-lisp
     c-c++
     (elfeed :variables
             rmh-elfeed-org-files (list "~/.emacs.d/private/elfeed.org"))
     emacs-lisp
     erc
     ess
     git
     gtags
     (haskell :variables
              haskell-process-type 'stack-ghci)
     ipython-notebook
     markdown
     org
     pdf-tools
     ;; (perspectives :variables
     ;;               dotspacemacs-display-default-layout t)
     python
     (shell :variables
            shell-default-shell 'eshell
            shell-enable-smart-eshell t
            shell-default-height 30
            shell-default-position 'bottom)
     ;; (shell :variables
     ;;        shell-default-shell 'shell
     ;;        shell-default-term-shell "/bin/bash"
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     themes-megapack
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(afternoon
                         monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (with-eval-after-load 'org
    (setq org-modules
          (quote
           (org-bbdb org-bibtex org-crypt org-docview org-gnus
                     org-info org-habit org-irc org-rmail org-w3m)))

    (setq org-agenda-files
          (quote
           ("~/Desktop/Org/dates.org"
            "~/Desktop/Org/finance.org"
            "~/Desktop/Org/gcal.org"
            "~/Desktop/Org/habits.org"
            "~/Desktop/Org/health.org"
            "~/Desktop/Org/hobbies.org"
            "~/Desktop/Org/home.org"
            "~/Desktop/Org/inbox.org"
            "~/Desktop/Org/learning.org"
            "~/Desktop/Org/vehicles.org"
            "~/Desktop/Org/work.org")))

    (setq org-use-tag-inheritance nil) ; prevent sub-items from inheriting tags

    (setq org-catch-invisible-edits 'smart) 

    (add-hook 'org-mode-hook 'turn-on-auto-fill)

    (setq org-agenda-custom-commands
          (quote
           (("x" "NEXT's this buffer" tags-tree "NEXT")
            ("X" "NEXT's all buffers" tags "NEXT")

            ("lw" "NEXT's in work files" tags-todo "NEXT"
             ((org-agenda-files
               '("~/Desktop/Org/work.org"))))

            ("lh" "NEXT's in home file" tags-todo "NEXT"
             ((org-agenda-files
               '("~/Desktop/Org/home.org"))))

            ("e" "Email" tags "EMAIL")

            ("p" "PROJECT's"
             tags "+PROJECT-SOMEDAY"
             ((org-use-tag-inheritance nil)))

            ("P" "PROJECT's and SOMEDAY's"
             tags ":PROJECT:|:SOMEDAY:"
             ((org-use-tag-inheritance nil)))

            ("w" tags-tree #(":PROJECT:/WAIT" 0 14 (face org-warning)))

            ("h" "Test agenda"
             ((agenda "" ((org-habit-show-habits t)
                          (org-agenda-span 'day)))))
             ;; ((agenda "" ((org-agenda-overriding-header "\nAgenda\n")
             ;;              (org-agenda-span 'day)
             ;;              (org-agenda-start-on-weekday nil)
             ;;              (org-deadline-warning-days 3)
             ;;              (org-habit-show-habits t)))
             ;;  (tags-todo "+NEXT")
             ;;  (tags "+PROJECT")))

            ("i" tags #(":PROJECT:" 0 9 (face org-warning))
             ((org-agenda-skip-function
               (lambda ()
                 (let ((subtree-end (save-excursion (org-end-of-subtree t))))
                   (if (re-search-forward "TODO\\|NEXT\\|WAIT" subtree-end t)
                       subtree-end
                     nil))))
              (org-agenda-overriding-header "Malformed projects: ")))

            ("j" "Test agenda"
             ((agenda "" ((org-agenda-overriding-header "\n")
                          (org-agenda-span 'day)
                          (org-agenda-start-on-weekday nil)
                          (org-deadline-warning-days 3)
                          (org-habit-show-habits nil)))
              (tags "+PROJECT")
              (tags-todo "+NEXT")))

            ("k" "Expanded agenda"
             ((agenda "" ((org-agenda-overriding-header "\nWeek Overview\n-----------\n")
                          (org-agenda-span 'week) ; overview of appointments
                          (org-agenda-start-on-weekday nil) ; calendar begins today
                          (org-agenda-repeating-timestamp-show-all t)
                          (org-agenda-entry-types '(:timestamp :sexp))))
              (agenda "" ((org-agenda-overriding-header "\nDaily Agenda\n------------\n")
                          (org-agenda-span 'day) ; daily agenda
                          (org-deadline-warning-days 7) ; 7 day advanced warning for deadlines
                          (org-agenda-todo-keyword-format "[ ]")
                          (org-agenda-scheduled-leaders '("" ""))
                          (org-agenda-prefix-format "%t%s")))
              (todo "TODO" ; todos sorted by context
                    ((org-agenda-prefix-format "[ ] %T: ")
                     (org-agenda-sorting-strategy '(tag-up priority-down))
                     (org-agenda-todo-keyword-format "")
                     (org-agenda-overriding-header
                      "\nTasks by Context\n------------------\n"))))
             ((org-agenda-with-color nil)
              (org-agenda-compact-blocks t)
              (org-agenda-remove-tags t)
              (ps-number-of-columns 2)
              (ps-landscape-mode t))
             ("~/agenda.ps")))))

    (add-hook 'org-agenda-mode-hook  ; highlight lines in the agenda view
              '(lambda ()
                 (hl-line-mode 1)))

    (setq org-agenda-remove-tags 't)

    ;; use an org file for dates

    (setq org-agenda-diary-file
          "~/Desktop/Org/dates.org")

    ;; set agenda sorting strategy

    (setq org-agenda-sorting-strategy
          '(time-up priority-down))

    (setq org-agenda-include-diary nil)

    (setq org-capture-templates
          (quote (("b" "niggle" entry   ; b for "bugs me!"
                   (file+headline "~/Desktop/Org/niggles.org" "Niggles")
                   "* %u %?" :prepend t)

                  ("i" "inbox" entry
                   (file+headline "~/Desktop/Org/inbox.org" "Tasks")
                   "* TODO %? %^g\n%u\n"
                   :empty-lines 1)

                  ("n" "notes" entry
                   (file+headline "~/Desktop/Org/notes.org" "Notes")
                   "* %u %?" :prepend t))))

    (setq org-use-speed-commands t)

    (setq org-todo-keywords
          '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "DONE(d!)")))

    (setq org-todo-keyword-faces
          (quote (("TODO" . (:foreground "green4"))
                  ("NEXT" . "SpringGreen")
                  ("WAIT" . "OrangeRed1")
                  ("DONE" . (:foreground "SteelBlue1")))))

    (setq org-priority-faces
          '((?A . (:foreground "red" :weight bold))
            (?B . (:foreground "blue" :weight bold))
            (?C . (:foreground "orchid4" :weight bold))))

    (setq org-use-fast-todo-selection 't)

    ;; remove the NEXT tag for any done states

    (setq org-todo-state-tags-triggers
          '((done ("NEXT" . nil)
                  ("OPEN" . nil))))

    (setq org-tag-alist '(("ADMIN"   . ?a)
                          ("COMMIT"  . ?c)
                          ("EMAIL"   . ?m)
                          ("ERRAND"  . ?e)
                          ("GOAL"    . ?g)
                          ("HACKING" . ?h)
                          ("PHONE"   . ?t)
                          ("READING" . ?r)
                          ("REPAIR"  . ?i)
                          ("VIDEO"   . ?v)
                          ("WRITING" . ?w)
                          (:startgroup . nil)
                          ("PROJECT" . ?p)
                          ("SOMEDAY" . ?s)
                          (:endgroup . nil)))
    ;; Don't split headlines in the middle

    (setq org-M-RET-may-split-line '((headline . nil)
                                     (default . t)))

    ;; return to activate a link

    (setq org-return-follows-link t)

    (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))

    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-use-outline-path 'file)
    (setq org-refile-targets '((nil :maxlevel . 3)              ; refile to headings in the cur buf
                               (org-agenda-files :maxlevel . 3) ; refile to any of these files
                               ))

    (defun npt/afiles ()
      (interactive)
      (let* ((files (mapcar #'file-name-nondirectory org-agenda-files))
             (names (mapcar #'file-name-sans-extension files)))
        (pp (sort names 'string<))))

    (defun npt/ps-org ()
      (interactive)
      (let ((ps-print-color-p 'black-white)
            (ps-font-size 10)
            (ps-landscape-mode nil)
            (ps-n-up-on nil)
            (ps-number-of-columns 1)
            (ps-print-header t)
            (ps-print-header-frame nil)
            (ps-header-lines 1)
            (ps-left-header nil)
            (ps-right-header '((lambda ()
                                 (concat (ps-get-buffer-name) " - " (ps-time-stamp-locale-default)))))
            (ps-header-font-size '(10 . 12))

            (ps-print-footer t)
            (ps-print-footer-frame nil)
            (ps-footer-lines 1)
            ;; (ps-header-pad 1)
            ;; (ps-footer-line-pad 0)
            (ps-left-footer nil)
            (ps-right-footer '("/pagenumberstring load"))
            (ps-footer-font-size '(10 . 12)))
        (ps-print-buffer-with-faces))))

    ; where to look for packages I'm building myself
    (add-to-list 'load-path "/opt/local/share/emacs/site-lisp/")
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-sexp-background-color "#efebe9")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (winum unfill madhat2r-theme fuzzy ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode autothemer seq lua-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks pcache slime-company hide-comnt elfeed-web simple-httpd elfeed-org org elfeed-goodies ace-jump-mode noflet elfeed pdf-tools tablist ein websocket undo-tree helm-gtags ggtags disaster company-c-headers cmake-mode clang-format yapfify uuidgen py-isort org-projectile org-download mwim live-py-mode link-hint intero hlint-refactor helm-hoogle git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump darkokai-theme company-ghci common-lisp-snippets column-enforce-mode clojure-snippets slime xterm-color shell-pop multi-term eshell-prompt-extras esh-help markdown-toc flycheck-haskell company-ghc ghc shm mmm-mode markdown-mode hindent haskell-snippets gh-md haskell-mode company-cabal cmm-mode zonokai-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme zenburn-theme monokai-theme solarized-theme clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider queue clojure-mode pyvenv pytest pyenv-mode py-yapf pip-requirements hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic f flycheck-pos-tip flycheck helm-flyspell auto-dictionary helm-company helm-c-yasnippet company-statistics company-quickhelp pos-tip company auto-yasnippet yasnippet ac-ispell auto-complete smeargle orgit magit-gitflow helm-gitignore request gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger evil-magit magit magit-popup git-commit with-editor org-pomodoro alert log4e toc-org org-repo-todo org-present gntp org-plus-contrib org-bullets htmlize gnuplot ws-butler window-numbering volatile-highlights vi-tilde-fringe spaceline s powerline smooth-scrolling restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox hydra spinner page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav define-word clean-aindent-mode buffer-move bracketed-paste auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(python-shell-interpreter "python" t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#eaeaea" :background "#181a26"))))
 '(hl-line ((t (:inherit highlight :background "gray15")))))

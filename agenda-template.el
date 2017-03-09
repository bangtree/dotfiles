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

            ("o" "NEXT's this buffer" tags-tree ":OPEN:")
            ("O" "NEXT's all buffers" tags ":OPEN:")

            ("p" "PROJECT's w/TODO's"
             tags "+PROJECT-SOMEDAY"
             ((org-use-tag-inheritance nil)))

            ("P" "PROJECT's and SOMEDAY's w/TODO's"
             tags-tree ":PROJECT:|:SOMEDAY:"
             ((org-use-tag-inheritance t)))

            ("w" tags-tree #(":PROJECT:/WAIT" 0 14 (face org-warning)))

            ("h" "Test agenda"
             ((agenda "" ((org-agenda-overriding-header "\nAgenda\n")
                          (org-agenda-span 'day)
                          (org-agenda-start-on-weekday nil)
                          (org-deadline-warning-days 3)
                          (org-habit-show-habits t)))
              (tags-todo "+NEXT")
              (tags "+PROJECT")))

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

 

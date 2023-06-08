;;; ../../dotfiles/.config/doom/org-notion-meetings-export.el -*- lexical-binding: t; -*-
;; https://notes.alexkehayias.com/org-mode-export-to-notion/
(require 'org)
(require 'ox-org)
(require 'request)

(org-export-define-derived-backend 'notion 'org
  :menu-entry
  '(?n "Export to Notion Meetings"
       ((?n "To Notion Meetings"
            (lambda (a s v b)
              (org-notion-meetings-export a s v b))))))

(defun notion-create-meeting (meeting-title meeting-notes)
  (let* ((notion-api-secret (getenv "NOTION_API_SECRET"))
         (database-id (getenv "ORG_NOTION_MEETINGS_DATABASE_ID"))
         (url (format "https://api.notion.com/v1/pages"))
         (headers `(("Notion-Version" . "2022-06-28")
                    ("Content-Type" . "application/json")
                    ("Authorization" . ,(format "Bearer %s" notion-api-secret))))
         (data `(("parent" . (("database_id" . ,database-id)))
                 ("properties" . (("Name" . (("title" . ((("text" . (("content" . ,meeting-title))))))))))
                 ("children" . ((("object" . "block")
                                 ("type" . "paragraph")
                                 ("paragraph" . (("rich_text" . ((("text" . (("content" . ,meeting-notes))))))))))))))
    (request
     url
     :type "POST"
     :headers headers
     :data (json-encode data)
     :parser 'json-read
     :error
     (cl-function (lambda (&rest args &key error-thrown response &allow-other-keys)
                    (message "Got error: %S, response: %S" error-thrown response)))
     :success (cl-function
               (lambda (&key data &allow-other-keys)
                 (message "Meeting notes page created: %s" (assoc-default 'json data)))))))

(defun org-notion-meetings-export (&optional async subtreep visible-only body-only ext-plist)
  (let ((title (org-element-property :title (org-element-at-point)))
        (body (org-export-as 'md subtreep visible-only body-only ext-plist)))
    (notion-create-meeting title body)))

(provide 'org-notion-meetings-export)

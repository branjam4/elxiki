(defmenu _init
  (concat "| Activate a line to set it.
| e.g. @ env/PATH=/opt/bin/:${PATH}, or you can call
| `elxiki-command' on any of the following lines:
> All Environment Variables:
"
          (mapconcat (lambda (s) (concat "- " s))
                     process-environment
                     "\n")))

(defmenu _root/_many
  (let ((var (elxiki-drop-root menu)))
    (unless (or (member (string-to-char var) '(?> ?|))
                (elxiki-prefix-p "delete/" var))
      (setq var (split-string var "="))
      (setenv (car var)
              (or (cadr var) "")
              'substitute)))
  "")

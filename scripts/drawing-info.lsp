;; drawing-info.lsp - Report basic drawing file information
;; Command: DWGINFO
(defun c:DWGINFO ( / ss n )
  (setq ss (ssget "_X")
        n (if ss (sslength ss) 0))
  (princ (strcat "\nFile:   " (getvar "DWGNAME")))
  (princ (strcat "\nFolder: " (getvar "DWGPREFIX")))
  (princ (strcat "\nLast saved: "
                 (menucmd "M=$(edtime,$(getvar,TDUPDATE),DD/MM/YYYY-HH:MM)")))
  (princ (strcat "\nObjects in drawing: " (itoa n)))
  (princ)
)

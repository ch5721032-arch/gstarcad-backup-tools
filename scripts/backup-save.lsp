;; backup-save.lsp - Save a dated backup copy of the drawing
;; Command: BACKUPSAVE
;; Note: the drawing is then saved under the new backup name.
(defun c:BACKUPSAVE ( / path name stamp )
  (vl-load-com)
  (setq path (getvar "DWGPREFIX")
        name (vl-filename-base (getvar "DWGNAME"))
        stamp (menucmd "M=$(edtime,$(getvar,date),YYYYMMDD-HHMM)"))
  (setvar "FILEDIA" 0)
  (command "_.SAVEAS" "2018" (strcat path name "-backup-" stamp ".dwg"))
  (setvar "FILEDIA" 1)
  (princ (strcat "\nBackup saved: " name "-backup-" stamp ".dwg"))
  (princ)
)

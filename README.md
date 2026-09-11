# GstarCAD Backup Tools

Save a dated backup copy of the drawing in one command and read the file's own information.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Losing an hour of drafting hurts more than any crash. These commands save a dated backup copy of the current drawing next to the original, and report the file name, folder, last save time and object count, so you always know what you are working on.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/backup-save.lsp` | ;; backup-save.lsp - Save a dated backup copy of the drawing
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
 |
| `scripts/drawing-info.lsp` | ;; drawing-info.lsp - Report basic drawing file information
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.

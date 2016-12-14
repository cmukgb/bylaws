# bylaws
The official bylaws of the CMU KGB

The text of the bylaws is stored (already formatted) in the plaintext file
`bylaws.current`.  The script `makebylaws.sh` exports this text (almost)
verbatim to a PDF.  This script should never need to be run by itself. The
Makefile provides commands to generate the bylaws.

To generate the bylaws PDF, make sure `bylaws.current` is up to date and run
`make` (or `make current`).

This should clean up any temporary files (tex, aux, log) it makes along the
way.  If you somehow end up with such files anyway, running `make clean` will
delete them.  If you also want to delete the generated PDF, use `make
veryclean` instead.

Most interactions with this repo will probably be to make amendments, so the
Makefile provides for this case.  When an amendment is proposed, copy
`bylaws.current` to `bylaws.amended`. Make the proposed changes to
`bylaws.amended`.  To generate the amended PDF, run `make amended`, which will
created `bylaws_amended.pdf`.

Keep in mind the bylaws say "Last amended on" at the very bottom, so be sure to
keep that up to date.  A good practice is to update this in `bylaws.amended`
when that file is created and use the date on which the vote will occur.  If
the vote passes, simply rename `bylaws.amended` to `bylaws.current` and the
date will be correct.

Whenever a PDF (current or amended) is generated, the previous PDF is moved to
`archives` and timestamped.

After the bylaws have been amended, be sure to update the following places:
* The PDF on The Bridge
* The Wiki
* The copy in the Exec Dropbox
* The AFS space - just pull the existing clone of this repo

### TL;DR

* `make` : Generate `bylaws.pdf` from `bylaws.current`
* `make amended` : Generate `bylaws_amended.pdf` from `bylaws.amended`


# This creates a pdf of the current bylaws, since that is the format
# that orgtracker insists on these days. Make sure that ~kgb/bylaws.current
# is up to date.

OFFICIAL_BYLAWS='/afs/andrew.cmu.edu/usr/kgb/bylaws.current'
TEX_BYLAWS='bylaws.tex'
PDF_BYLAWS='bylaws.pdf'

cat <<EOF >$TEX_BYLAWS
\\documentclass{article}
\\usepackage{graphicx}
\\begin{document}
\\oddsidemargin0cm
\\topmargin-2cm
\\textwidth16.5cm
\\textheight23.5cm
\\begin{quote}
\\begin{verbatim}
EOF
cat $OFFICIAL_BYLAWS >>$TEX_BYLAWS
(echo; echo;
 echo -n "                 (Compiled ";
 date +"%B %d, %Y by ${USER})") >>$TEX_BYLAWS
cat <<EOF >>$TEX_BYLAWS
\\end{verbatim}
\\end{quote}
\\end{document}
EOF

pdflatex $TEX_BYLAWS
cp $PDF_BYLAWS ..

#!/bin/bash
# Builds one representative PDF per version into board/.
# Every PDF shows the same paper: CHIL, final version, same title and authors.
# V6 is V5 in one column.
# Usage: tools/build-board.sh
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
TITLE='\\title[Predicting Hospital Readmission from Clinical Notes]{Predicting Hospital Readmission from Clinical Notes with Large Language Models: A Multi-Site Evaluation}'

# Author block in the old jmlr format (V0 and V1).
cat > "$TMP/authors_old.tex" <<'TEX'
\author{%
\Name{Anna Adams}\equal{These authors contributed equally} \Email{anna.adams@university-x.edu}\\
\Name{Ben Brown}\footnotemark[1] \Email{ben.brown@university-x.edu}\\
\Name{David Diaz} \Email{david.diaz@university-x.edu}\\
\Name{Grace Garcia} \Email{grace.garcia@university-x.edu}\\
\addr Department of Computer Science, University X, Country 1
\AND
\Name{Clara Chen} \Email{clara.chen@hospital-y.org}\\
\Name{Felix Fischer} \Email{felix.fischer@hospital-y.org}\\
\addr Department of Medicine, University Hospital Y, Country 2
\AND
\Name{Emma Evans} \Email{emma.evans@company-z.com}\\
\addr Company Z, Country 3
}
TEX

# set_title FILE: replace the \title[...]{...} command (one or two lines).
set_title() {
  python3 - "$1" "$TITLE" <<'PY'
import sys
p, title = sys.argv[1], sys.argv[2].replace('\\\\', '\\')
m = open(p).read()
i = m.index('\n\\title[') + 1
j = m.index('\n\n', i)
open(p, 'w').write(m[:i] + title + m[j:])
PY
}
# set_old_authors FILE: replace the active \author{...} block.
set_old_authors() {
  python3 - "$1" "$TMP/authors_old.tex" <<'PY'
import sys
p = sys.argv[1]; m = open(p).read(); new = open(sys.argv[2]).read()
i = m.rindex('\n\\author{%') + 1
j = m.index('\n}\n', i) + 3
open(p, 'w').write(m[:i] + new + m[j:])
PY
}
compile() { (cd "$1" && latexmk -pdf -interaction=nonstopmode -halt-on-error "$2" > build.log 2>&1) || { echo "FAILED: $1"; exit 1; }; }
# Switch the sample to the final version.
FINAL='s/^\\usepackage\[venue=chil/\\usepackage[final,volume=XXX,venue=chil/'
ONECOL='s/^\\documentclass\[pmlr,twocolumn,10pt\]{jmlr}/\\documentclass[pmlr,10pt]{jmlr}/'

# V0: the CHIL 2027 template as it is today
cp -R "$ROOT/CHIL_2027" "$TMP/v0"
set_title "$TMP/v0/chil-sample.tex"; set_old_authors "$TMP/v0/chil-sample.tex"
# No page range in the header, as decided for all versions (decision D5).
sed -i.bak 's/^\\jmlrvolume{LEAVE UNSET}/\\jmlrvolume{LEAVE UNSET,}\\jmlrpages{}/' "$TMP/v0/chil-sample.tex"
compile "$TMP/v0" chil-sample.tex
cp "$TMP/v0/chil-sample.pdf" "$ROOT/board/V0-current.pdf"

# build FOLDER PDFNAME [old]
build() {
  cp -R "$ROOT/variants/$1" "$TMP/$2"
  set_title "$TMP/$2/main.tex"
  [ "$3" = "old" ] && set_old_authors "$TMP/$2/main.tex"
  sed -i.bak "$FINAL" "$TMP/$2/main.tex"
  compile "$TMP/$2" main.tex
  cp "$TMP/$2/main.pdf" "$ROOT/board/$2.pdf"
  cp "$TMP/$2/main.pdf" "$ROOT/variants/$1/previews/chil-final.pdf"
}
build v1-harmonized      V1-harmonized old
build v2-useful-minimum  V2-useful-minimum
build v3-sans-headings   V3-sans-headings
build v4-modern-font     V4-modern-font
build v5-modern-design   V5-modern-design

# V6: V5 in one column
cp -R "$ROOT/variants/v5-modern-design" "$TMP/V6"
set_title "$TMP/V6/main.tex"
sed -i.bak "$FINAL" "$TMP/V6/main.tex"
sed -i.bak "$ONECOL" "$TMP/V6/main.tex"
compile "$TMP/V6" main.tex
cp "$TMP/V6/main.pdf" "$ROOT/board/V6-modern-design-one-column.pdf"

rm -rf "$TMP"
echo "Board PDFs written to $ROOT/board"

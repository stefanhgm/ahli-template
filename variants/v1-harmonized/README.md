# AHLI LaTeX template for CHIL and ML4H

One template for both venues. It builds on the official `jmlr` class used by PMLR.

## For authors

1. Write your paper in `main.tex`.
2. Set venue, track and version in one line near the top of the file:

   ```latex
   \usepackage[venue=chil]{ahli}                    % CHIL, review version
   \usepackage[venue=ml4h,track=findings]{ahli}     % ML4H, review version
   \usepackage[venue=chil,final,volume=123]{ahli}   % camera-ready version
   ```

3. Compile with pdfLaTeX.

| Option | Meaning |
|---|---|
| `venue=chil` or `venue=ml4h` | Required. |
| `track=...` | ML4H only: `proceedings`, `findings`, `demo` or `perspective`. CHIL has one track and needs no option. |
| `review` | Default. Line numbers on. Authors, acknowledgments and copyright line hidden. |
| `final` | Camera-ready. Line numbers off. Authors shown. |
| `volume=N` | PMLR volume number. You receive it after acceptance. |
| `year=YYYY` | Only needed to override the default year. |

Enter your real author list from the start. The review version hides it for you.

Give every figure a short description for screen readers: `\includegraphics[alt={...}]{...}`.

Do not edit `ahli.sty`, `jmlr.cls` or `jmlrutils.sty`. Do not change margins, fonts or spacing.

## For chairs

Everything that changes from year to year is in section 1 of `ahli.sty`:

- the default year
- the call for papers link of each venue
- the list of tracks with name, page limit text and three yes/no settings
  (published in PMLR, anonymous review, required sections)

To add a track, copy one `\ahli@deftrack` block and change its values.

## Files

| File | Purpose |
|---|---|
| `main.tex` | Sample paper for both venues. |
| `ahli.sty` | All AHLI code. |
| `jmlr.cls`, `jmlrutils.sty` | Official jmlr class, version 1.30, not modified. |
| `ref.bib`, `images/` | Sample references and figures. |
| `previews/` | Compiled examples. |

## Source and license of the jmlr class

`jmlr.cls` and `jmlrutils.sty` are unmodified copies from CTAN:
https://ctan.org/pkg/jmlr

They are written by Nicola Talbot and distributed under the LaTeX Project
Public License, version 1.3 or later. The full package with documentation
and source files is available at the link above.

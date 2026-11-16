# AHLI template: change log

This file tracks every change to the shared LaTeX template for CHIL and ML4H.
Each variant builds on the one before it.

| Variant | In one sentence | Representative PDF | Status |
|---|---|---|---|
| V0 Current | The CHIL 2027 template as it is today. For comparison only. | `board/V0-current.pdf` | Reference |
| V1 Harmonized | One shared template for CHIL and ML4H. Same look as today. | `board/V1-harmonized.pdf` | Built. Waiting for board review. |
| V2 Useful minimum | V1 plus a new author block, one link color and clearer instructions. | not built yet | Planned |
| V3 Modern, two columns | V2 plus updated fonts, headings and appendix design. | not built yet | Planned |
| V4 Modern, one column | V3 in a single column layout. | not built yet | Planned |

Each representative PDF shows the same case: a CHIL paper in the final version with three authors. Page 1 shows most of the differences.

---

## V1 Harmonized

**Goal:** one template for both venues. Same look as today. Easier to maintain.

**Compared with:** the CHIL 2027 template and the ML4H 2026 template.

### Key changes in short

1. **One template for both venues.** One style file and one sample paper for CHIL and ML4H.
2. **Official jmlr class.** We use version 1.30 from CTAN without edits. Our code sits in `ahli.sty`.
3. **One line to set up a paper.** Authors choose venue, track and review or final version in one place.
4. **Flexible tracks.** All tracks and their rules are in one list that chairs edit once per year.
5. **Automatic review version.** Line numbers on. Authors, acknowledgments and copyright line hidden.
6. **Required sections at the end.** Data and Code Availability, IRB and AI Usage for both venues. They do not count toward the page limit.
7. **Keywords removed.**
8. **Bugs fixed.** No more "LEAVE UNSET" header, empty copyright line or leaked author initials in review.

The look of the paper stays the same as today. The full list with reasons follows below.

### What is in the folder

| File | Purpose |
|---|---|
| `jmlr.cls`, `jmlrutils.sty` | The official jmlr class, version 1.30 from CTAN. Not modified. |
| `ahli.sty` | All AHLI code. One file for both venues. |
| `main.tex` | One sample paper for both venues. |
| `ref.bib`, `images/` | Sample references and figures. |
| `previews/` | Compiled PDFs for CHIL and for the ML4H tracks. |

### How authors use it

Authors change one line at the top of `main.tex`.

```latex
\usepackage[venue=chil]{ahli}                    % CHIL, review version
\usepackage[venue=ml4h,track=findings]{ahli}     % ML4H, review version
\usepackage[venue=chil,final,volume=123]{ahli}   % camera-ready version
```

### Changes

| ID | Change | Why | Visible to authors or readers? |
|---|---|---|---|
| C01 | We use the official jmlr class v1.30 without edits. The old templates shipped hand-edited copies of v1.27. | We can say the template builds on the official PMLR class. Updates are easy. | Almost none. See note N1. |
| C02 | All AHLI code is in one file, `ahli.sty`. | One code base for CHIL and ML4H. No more separate copies. | No |
| C03 | One sample file `main.tex` for both venues. | Same reason. A paper moves between venues by changing one line. | No |
| C04 | Venue, track, year and version are options on one line. | Simple for authors. Nothing to edit by hand in the header. | Yes, simpler setup |
| C05 | Tracks are defined in one list at the top of `ahli.sty`. Each track has a name, a page limit text and three yes/no settings: published in PMLR, anonymous review, required sections. | Chairs change one block per year. New tracks are easy to add. | No |
| C06 | CHIL has one track. It is the default, so CHIL authors do not type a track. ML4H has four tracks: proceedings, findings, demo, perspective. | Same system for both venues. | No |
| C07 | A missing or unknown track stops with a clear error and a red box on page 1. | Same behavior as ML4H 2026. | No |
| C08 | Review version: line numbers turn on automatically. Final version: they turn off. | Authors no longer forget to remove them. | Yes, simpler |
| C09 | Review version: the author list is replaced by "Anonymous Author(s)" automatically. Acknowledgments and the copyright line are hidden too. | Fewer anonymity mistakes. NeurIPS, ICML, TMLR and COLM do the same. | Yes |
| C10 | The copyright line at the bottom of page 1 appears only in the final version. | The CHIL review version printed author initials there. The ML4H review version printed an empty "©". | Yes, bug fix |
| C11 | Review header reads "Submitted to CHIL 2027" or "Submitted to ML4H 2027: Findings Track". | CHIL printed "LEAVE UNSET" in the header. Now both venues match. | Yes, CHIL only |
| C12 | Required sections go at the end of the paper, before the references, for both venues. They do not count toward the page limit. | Follows the CHIL 2027 call for papers. | Yes, ML4H only. See D2. |
| C13 | The sample includes the Statement on AI Usage for both venues. | Follows CHIL 2027. | Yes, ML4H only. See D1. |
| C14 | Each required section starts with a generated note. It says if the section is required for the selected track. | Authors see the rule for their own track. | Yes |
| C15 | Keywords are removed. | NeurIPS, TMLR and COLM have no keywords. CHIL had none. | Yes, ML4H only. See D3. |
| C16 | Short title in the header of every page. | Same as today. The official class would alternate title and author names. | No |
| C17 | Loading the `subfig` package stops with an error. | Same as today. It breaks the proceedings production. | No |
| C18 | Page limits are text only. They sit in the track list in `ahli.sty`. | Each venue sets its own wording each year. | No |
| C19 | The year is an option with a default. The template has no year in file names or code. | The same files work in future years. | No |
| C20 | Small sample details aligned: URLs use the text font, the decimal alignment table is included, the instruction list is shown for both venues. | CHIL and ML4H samples differed in these points. | Minor |
| C21 | Problems of the old hand-edited class are gone: lower-case "jmlr" in some messages, a broken check for the `geometry` and `pdfpages` packages, a missing comma in the CHIL header. | They came from manual edits. | No |

### Notes

- **N1.** The official class v1.30 places captions of sub-figures slightly differently from the old v1.27 copy. In the sample this moves one caption on page 5. Page count and page breaks stay the same.
- **N2.** The ML4H final header shows the page range again, for example "Proceedings of Machine Learning Research XXX:1-8, 2027". CHIL already shows it. ML4H 2026 had removed it. See D5.
- **N3.** The old folders (`CHIL_2026`, `CHIL_2027`, `ML4H_*`) are not changed. They stay as reference.
- **N4.** `jmlrbook.cls` is no longer shipped. Authors do not need it.

### Decisions for the board

| ID | Decision | Current choice in V1 | Applies to |
|---|---|---|---|
| D1 | Should ML4H require the Statement on AI Usage? | Yes, same as CHIL 2027. | ML4H |
| D2 | Should the required sections go at the end and not count toward the page limit? | Yes, same as CHIL 2027. ML4H had them after the abstract. | ML4H |
| D3 | Remove keywords? | Yes. | ML4H |
| D4 | Hide authors, acknowledgments and copyright line automatically in the review version? | Yes. Applies to tracks with anonymous review. ML4H demo and perspective tracks show authors, as in 2026. | Both |
| D5 | Show the page range in the final PMLR header for ML4H? | Yes, same as CHIL and the official class. | ML4H |
| D6 | Use the official jmlr class v1.30 without edits and keep all AHLI code in `ahli.sty`? | Yes. | Both |
| D7 | Which tracks need the required sections? | CHIL: yes. ML4H proceedings and findings: yes. ML4H demo and perspective: no. Taken from ML4H 2026. | ML4H |

### To check before release

- The CHIL call for papers link in `ahli.sty` is a placeholder (`https://chil.ahli.cc/`). Please confirm the correct link.
- ML4H page limits are copied from 2026. Please confirm them for 2027.
- The default year is 2027 for both venues.
- Test the template on Overleaf and with two or three real papers from past years.
- The jmlr class has the LaTeX Project Public License. We ship the two files unchanged. We should add a short note with the source link (CTAN) to the template folder.

### Tests done

All builds use TeX Live 2026 with pdfLaTeX. All compile without errors and give 8 pages. The sample has 4 lines that run slightly into the margin. The old CHIL sample had 6.

| Build | Result | Preview |
|---|---|---|
| CHIL, review | OK | `previews/chil-review.pdf` |
| CHIL, final | OK | `previews/chil-final.pdf` |
| ML4H proceedings, review | OK | `previews/ml4h-proceedings-review.pdf` |
| ML4H proceedings, final | OK | `previews/ml4h-proceedings-final.pdf` |
| ML4H findings, review | OK | not stored |
| ML4H findings, final | OK | `previews/ml4h-findings-final.pdf` |
| ML4H demo, review | OK | `previews/ml4h-demo-review.pdf` |
| ML4H perspective, final, year 2028 | OK | not stored |
| ML4H without track | Error and red box, as intended | not stored |
| ML4H with unknown track | Error and red box, as intended | not stored |
| `subfig` package loaded | Error, as intended | not stored |

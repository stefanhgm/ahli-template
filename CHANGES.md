# AHLI template: change log

This file tracks every change to the shared LaTeX template for CHIL and ML4H.
Each variant builds on the one before it.

| Version | In one sentence | Representative PDF | Folder |
|---|---|---|---|
| V0 Current | The CHIL 2027 template as it is today, without the page range in the header. For comparison only. | `board/V0-current.pdf` | `CHIL_2027/` |
| V1 Harmonized | One shared template for CHIL and ML4H. Same look as today. | `board/V1-harmonized.pdf` | `variants/v1-harmonized/` |
| V2 Useful minimum | V1 plus a new author block, preprint mode and an automatic "et al." rule. | `board/V2-useful-minimum.pdf` | `variants/v2-useful-minimum/` |
| V3 Sans headings | V2 plus a light refresh: sans-serif headings, AHLI blue links, one-column appendix. Current font. | `board/V3-sans-headings.pdf` | `variants/v3-sans-headings/` |
| V4 Modern font | V3 with the modern font STIX Two and the classic layout with serif headings. | `board/V4-modern-font.pdf` | `variants/v4-modern-font/` |
| V5 Modern design | V4 plus sans-serif headings and an own title design. | `board/V5-modern-design.pdf` | `variants/v5-modern-design/` |
| V6 Modern design, one column | V5 in one column. | `board/V6-modern-design-one-column.pdf` | `variants/v5-modern-design/` without `twocolumn` |

All versions are first prototypes for the board. Each version builds on the one before.

V6 uses the same files as V5. Only the first line of `main.tex` differs. V3 and V4 can be set in one column the same way.

Each representative PDF shows the same case: a CHIL paper in the final version with 7 authors, 3 affiliations, two equal first authors and one corresponding author. Page 1 shows most of the differences. The old author format in V0 and V1 cannot show two affiliations for one author. It also has to group authors by affiliation, so the author order changes. The PDFs are built with `tools/build-board.sh`. The short list of questions for the board is in `board/DECISIONS.md`.

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
| `README.md` | Short guide for authors and chairs. |
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
| C22 | A short `README.md` in the template folder. It explains the options for authors and the yearly settings for chairs. It also names the source and license of the jmlr class. | TMLR, COLM and JMLR ship a README too. | No |
| C54 | Alt text for figures. The sample shows `\includegraphics[alt={...}]{...}` and the instructions ask for it. | Screen readers can describe figures. A first step toward accessible PDFs. | No |

### Notes

- **N1.** The official class v1.30 places captions of sub-figures slightly differently from the old v1.27 copy. In the sample this moves one caption on page 5. Page count and page breaks stay the same.
- **N2.** The final PMLR header shows volume and year without a page range, for example "Proceedings of Machine Learning Research XXX, 2027". This follows ML4H 2026. CHIL 2027 showed a page range such as "XXX:1-8, 2027". See D5.
- **N3.** The old folders (`CHIL_2026`, `CHIL_2027`, `ML4H_*`) are not changed. They stay as reference.
- **N4.** `jmlrbook.cls` is no longer shipped. Authors do not need it.

### Decisions for the board

| ID | Decision | Current choice in V1 | Applies to |
|---|---|---|---|
| D1 | Should ML4H require the Statement on AI Usage? | Yes, same as CHIL 2027. | ML4H |
| D2 | Should the required sections go at the end and not count toward the page limit? | Yes, same as CHIL 2027. ML4H had them after the abstract. | ML4H |
| D3 | Remove keywords? | Yes. | ML4H |
| D4 | Hide authors, acknowledgments and copyright line automatically in the review version? | Yes. Applies to tracks with anonymous review. ML4H demo and perspective tracks show authors, as in 2026. | Both |
| D5 | Show the page range in the final PMLR header? | No. Taken over from ML4H 2026. CHIL showed it. The V0 board PDF also leaves it out. | CHIL |
| D6 | Use the official jmlr class v1.30 without edits and keep all AHLI code in `ahli.sty`? | Yes. | Both |
| D7 | Which tracks need the required sections? | CHIL: yes. ML4H proceedings and findings: yes. ML4H demo and perspective: no. Taken from ML4H 2026. | ML4H |
| D28 | Accessibility: require alt text for figures now and aim for fully tagged PDFs later? | Yes. Alt text from V1 on. Tagged PDFs once the LaTeX tools support our class. | Both |

### To check before release

- The CHIL call for papers link in `ahli.sty` is a placeholder (`https://chil.ahli.cc/`). Please confirm the correct link.
- ML4H page limits are copied from 2026. Please confirm them for 2027.
- The default year is 2027 for both venues.
- Test the template on Overleaf and with two or three real papers from past years.

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

---

## V2 Useful minimum

**Goal:** V1 plus a small set of useful changes. Layout, fonts and columns stay the same.

**Folder:** `variants/v2-useful-minimum/`

### Key changes in short

1. **New author block.** Names are centered and next to each other. Affiliations are numbered and listed below the names.
2. **Emails only for corresponding authors.** They appear in a footnote on page 1, together with the equal contribution note.
3. **ORCID iD.** Optional for each author. Shown as a small linked icon.
4. **One link color.** URLs use the same blue as citations and references.
5. **Preprint version.** A third option next to review and final, for example for arXiv.
6. **Automatic "et al." rule.** References with more than 10 authors show the first 10 and then "et al.".
7. **PDF properties.** Title and authors are stored in the PDF. Authors are hidden in review.
8. **Line numbers near equations fixed.**
9. **Alt text for figures.** The sample shows how to add a short description for screen readers.

### How authors enter the author block

```latex
\ahliauthor[0000-0002-1825-0097]{Anna Adams}{equal,uni}
\ahliauthor{Ben Brown}{equal,uni,hosp}
\ahliaffiliation{uni}{Department of Computer Science, University X, Country 1}
\ahliaffiliation{hosp}{Department of Medicine, University Hospital Y, Country 2}
\ahlicorrespondingauthor{Anna Adams}{anna.adams@university-x.edu}
```

This follows the ICML template. Authors use short labels for affiliations. The template numbers them.

### Changes

| ID | Change | Why | Visible to authors or readers? |
|---|---|---|---|
| C23 | New author block. Names centered and side by side. Numbered affiliations below, one per line. | One fixed style for all papers. Saves space with many authors. Authors can have several affiliations. | Yes |
| C24 | New author commands: `\ahliauthor`, `\ahliaffiliation`, `\ahlicorrespondingauthor`. The old commands `\author`, `\Name`, `\Email`, `\addr` stop with a clear error. | Simple and hard to get wrong. Same idea as ICML. Only one style is possible. | Yes. Old papers must retype the author block once. |
| C25 | Affiliation numbers are assigned automatically. No numbers if there is only one affiliation. | Fewer mistakes. | Yes |
| C26 | Emails appear only for corresponding authors, in a footnote on page 1: "Correspondence to: Name <email>". | Keeps the author block clean. Same as ICML and most journals. | Yes |
| C27 | Equal contribution is marked with `*` and explained in the same footnote. | Replaces the old `\equal` and `\footnotemark` trick. | Yes |
| C28 | Optional ORCID iD per author, shown as the green ORCID icon with a link. Hidden in review. | Requested. Uses the standard `orcidlink` package. | Yes |
| C29 | URLs use the same blue as citations and references. Magenta is gone. | One consistent link color. Stays close to the current look. | Yes, small |
| C30 | New option `preprint`. Authors shown, no line numbers, header says "Preprint", no copyright line. | For arXiv and similar. NeurIPS, ICML and TMLR have this option too. | Yes |
| C31 | Reference list style `ahli.bst`. It is the standard `plainnat` style with one change: more than 10 authors are shortened to the first 10 and "et al.". | One automatic rule. Authors do not need to do anything. | Yes |
| C32 | PDF properties: title always, authors only when they are shown. | Helps indexing. Same as ICML. | No |
| C33 | Line numbers now also appear next to paragraphs that end with a displayed equation. | Known problem of the line number package. Same fix as NeurIPS. | Yes, review only |
| C34 | The ORCID icon has a text label for screen readers. | Accessibility. | No |
| C35 | The copyright line is unchanged: jmlr format with initials. | Stay compatible with PMLR. | No |

### Notes

- **N5.** The sample text is the same as in V1, apart from the author part and two sentences. A shorter sample with clearer instructions can follow after the board decision.
- **N6.** The abstract keeps the jmlr default width.
- **N7.** Fully accessible (tagged) PDFs are not possible yet. The LaTeX Tagging Project lists the line number package and `algorithm2e` as not compatible, and the jmlr class is not tested. A test compiled, but with 39 to 52 structure warnings per paper. We include alt text now and aim for tagged PDFs once the tools support our class.
- **N8.** The representative PDF has 7 authors, 3 affiliations, two equal first authors, one corresponding author and two ORCID iDs. The names and iDs are examples.

### Decisions for the board

| ID | Decision | Current choice in V2 | Applies to |
|---|---|---|---|
| D8 | Adopt the new author block? | Yes. | Both |
| D9 | Stop supporting the old author commands? | Yes. They give an error with a hint. The alternative is to keep them working, but then two styles exist. | Both |
| D10 | Show emails only for corresponding authors, in a footnote? | Yes. | Both |
| D11 | ORCID iD: optional or expected? | Optional. | Both |
| D12 | "et al." rule in the reference list. | Automatic after 10 authors. ICML, TMLR and COLM list all authors. The number is one setting in `ahli.bst`. | Both |
| D13 | One link color? | Yes, the current blue. | Both |
| D14 | Offer a preprint version? | Yes. | Both |

### To check before release

- Test the author block with very long author lists and long affiliations.
- Test on Overleaf. The `orcidlink` package must be available.
- Check with PMLR that a custom reference style is fine for them. Authors submit PDFs, so we expect no problem.

### Tests done

All builds use TeX Live 2026 with pdfLaTeX. All compile without errors and give 8 pages.

| Build | Result | Preview |
|---|---|---|
| CHIL, final | OK | `previews/chil-final.pdf` |
| CHIL, review | OK. Authors, footnote and PDF author hidden. | `previews/chil-review.pdf` |
| CHIL, preprint | OK | `previews/chil-preprint.pdf` |
| ML4H proceedings, final | OK | `previews/ml4h-proceedings-final.pdf` |
| ML4H proceedings, review | OK | not stored |
| ML4H demo, review | OK. Authors shown, as this track is not anonymous. | not stored |
| One shared affiliation | OK. No numbers shown. | not stored |
| Reference with 12 authors | OK. First 10 and "et al.". | not stored |
| Old `\author` command | Error with hint, as intended | not stored |
| Affiliation label not defined | Error with hint, as intended | not stored |
| Alt text on a figure | OK | not stored |
| Tagged PDF switched on | Compiles. Not validated. | not stored |

---

## V3 Sans headings

**Goal:** V2 with a light refresh. Current font, two columns.

**Folder:** `variants/v3-sans-headings/`

From V3 on, all versions use the same `ahli.sty`. The look is chosen with options in `main.tex`. V3 uses `font=lm, look=calm`.

| ID | Change | Why | Visible? |
|---|---|---|---|
| C36 | Body font Latin Modern with modern encoding. | Same look as today. Sharper output. Accented names can be copied and searched. Same as TMLR. | Hardly |
| C37 | Finer spacing with the `microtype` package. | Fewer lines that run into the margin. Same as COLM. | Hardly |
| C38 | Title, headings and "Abstract" in bold sans-serif. Sub-sub-sections in sans-serif italic, no small caps. | Clearer hierarchy. Same idea as TMLR. | Yes |
| C39 | One link color: the blue of the AHLI logo (3A53A0). | Reads better than bright blue. Ties the template to AHLI. A fixed brand color stays stable over the years. | Yes |
| C40 | Captions slightly smaller with a bold label. | Captions stand apart from the text. Saves space. | Yes |
| C41 | Appendix starts on a new page and uses one column. | More room for wide tables, proofs and figures. Same as ICML. | Yes |
| C42 | `booktabs` is loaded by default. | Clean tables without vertical lines. | No |
| C43 | Options: `font=stix`, `lm` or `times`. `headings=sans` or `serif`. `look=bold` or `calm`. `appendix=onecolumn` or `twocolumn`. | Each point can be chosen on its own. | No |

## V4 Modern font

**Goal:** show what the modern font alone does. Classic layout, two columns.

**Folder:** `variants/v4-modern-font/`. Options: `font=stix, look=calm, headings=serif`.

| ID | Change | Why | Visible? |
|---|---|---|---|
| C44 | Body font STIX Two for text and math. | A modern font made for scientific publishing. Text and equations match. Close to Times, so it feels familiar. Open source. | Yes |
| C45 | Headings and title stay serif and centered, as today. | Shows the effect of the font without other design changes. | No |

## V5 Modern design

**Goal:** V4 plus an own title design. Two columns.

**Folder:** `variants/v5-modern-design/`. This is the default look of `ahli.sty`.

| ID | Change | Why | Visible? |
|---|---|---|---|
| C46 | Headings and title in Source Sans. | A clean sans-serif that pairs well with STIX Two. | Yes |
| C47 | Title and author block left-aligned, larger title, a black rule above the title. | Common in current journals. Works well with long titles. NeurIPS and ICML also use a rule at the title. | Yes |
| C48 | Abstract at full column width, heading left-aligned. | Fits the left-aligned title. Gains a few lines. | Yes |
| C49 | Color is used for links only. Headings, numbers and the title rule are black. | Conservative use of color. Stable over the years. | No |

## V6 Modern design, one column

**Goal:** show the modern design in one column. V6 is V5 in one column: `board/V6-modern-design-one-column.pdf`.

| ID | Change | Why | Visible? |
|---|---|---|---|
| C51 | One column, 5.5 inches wide, 10 point font. Chosen with `\documentclass[pmlr,10pt]{jmlr}` without `twocolumn`. | Same text block as NeurIPS. Easier to read on screens. Better for equations and tables. Simpler for figures. | Yes |
| C52 | The same `ahli.sty` supports one and two columns. | One code base for all layouts. | No |
| C53 | In one column the appendix starts on a new page and keeps the same layout. | No column switch is needed. | No |

## Notes for V3 to V5

- **N9.** The sample has 9 pages from V3 on, because the appendix starts on a new page. The main text takes the same space as in V2.
- **N12.** STIX Two works with the jmlr class in our tests. No conflict with the math packages that the class loads.
- **N13.** STIX Two is slightly more compact than the current font.
- **N15.** PMLR has no rule against a different font as far as we know. We should confirm with them.
- **N16.** One column holds less text per page. In the sample, the main text takes 7 pages in two columns and 10 pages in one column. Page limits would need to go up by about 40 percent. This is a rough number from the sample. It should be checked with real papers.
- **N17.** The two parts of the page 1 header come close to each other in one column. This needs a small fix if the board chooses one column.
- **N19.** Not included yet: shorter sample text with clearer instructions. Tests on Overleaf and with real papers.
- **N20.** All board PDFs compile without errors with TeX Live 2026 and pdfLaTeX.

## Decisions for V3 to V5

| ID | Decision | Current choice |
|---|---|---|
| D15 | Headings and title in bold sans-serif? | V3 and V5: yes. V4: no. |
| D16 | Body font? | V3: Latin Modern, the current look. V4 and V5: STIX Two. |
| D17 | Link color? | One color: the blue of the AHLI logo. |
| D18 | Captions smaller, with a bold label? | Yes. |
| D19 | Appendix on a new page and in one column? | Yes, as ICML does. Option to keep two columns. |
| D20 | Finer text spacing (microtype package)? | Yes. |
| D24 | Title and authors left-aligned with a black rule above the title? | V5 only. |
| D25 | Abstract at full column width with a left-aligned heading? | V5 only. |
| D26 | One column or two columns? | Open. |
| D27 | If one column: new page limits? | Open. About 40 percent more pages for the same content. |

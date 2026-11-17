# New AHLI template for CHIL and ML4H: first round

These are first prototypes. We ask the board **how far it wants to go**. After your feedback we build three refined versions.

## The versions

All PDFs show the same example paper. Page 1 shows most of the differences.

| Version | What it is | PDF |
|---|---|---|
| V0 | Today (CHIL 2027 template) | `V0-current.pdf` |
| V1 | One shared template for both venues. Same look as today. | `V1-harmonized.pdf` |
| V2 | V1 plus a new author block | `V2-useful-minimum.pdf` |
| V3 | V2 plus sans-serif headings and a light refresh | `V3-sans-headings.pdf` |
| V4 | V3 with a modern font (STIX Two) and the classic layout | `V4-modern-font.pdf` |
| V5 | V4 plus an own title design | `V5-modern-design.pdf` |
| V6 | V5 in one column | `V6-modern-design-one-column.pdf` |

## Four questions for the board

| # | Question | Look at |
|---|---|---|
| 1 | **How far should the new look go?** V2 (same look), V3 (new headings), V4 (new font), V5 (new font and title design) or V6 (V5 in one column)? | Page 1 of V2 to V6 |
| 2 | **One column or two columns?** One column needs about 40 percent more pages for the same content, so page limits would change. | V5 and V6 |
| 3 | **Same rules for both venues?** Required sections (data and code, IRB, AI usage) at the end of the paper and outside the page limit. AI usage statement also for ML4H. No keywords. | Last pages of V1 |
| 4 | **Accessibility:** require a short text description (alt text) for every figure now, and aim for fully accessible PDFs once the LaTeX tools support our class? | All versions |

**Our proposal:** V4 or V5 for question 1. Yes for questions 3 and 4. Question 2 is open.

## Defaults we will apply unless someone objects

These are in every version from V1 or V2 on.

- **One code base** for CHIL and ML4H, built on the official PMLR class without edits. Year, tracks and page limits are settings in one place.
- **Automatic review version:** line numbers on. Authors, acknowledgments and copyright line hidden.
- **New author block** (from V2): names side by side, numbered affiliations below, emails only for corresponding authors in a footnote. Papers from old templates retype the author block once.
- **ORCID links** next to author names are optional (from V2).
- **Long author lists in references** are shortened automatically: first 10 authors, then "et al." (from V2).
- **Preprint version** for arXiv (from V2).
- **Appendix** on a new page and in one column (from V3).
- **No page range** in the PMLR header, as in ML4H 2026.

## Good to know

- **Why STIX Two:** it was made by scientific publishers for papers. Text and equations use the same font. It is open source and looks like a cleaner Times, so it stays familiar.
- **PMLR:** all versions use the official PMLR class. We should confirm the new font with PMLR before a final decision.
- **Accessibility:** fully accessible (tagged) PDFs are not possible yet. Line numbers and algorithms are not supported by the LaTeX tagging tools. A unified and maintained template is the base to add this later in one place.
- **Not yet done:** shorter and clearer instructions in the sample paper. Tests on Overleaf and with real papers from past years.

The full list of changes is in `CHANGES.md` in the main folder.

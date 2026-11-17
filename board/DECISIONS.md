# New AHLI template for CHIL and ML4H: first round

These are first prototypes. We ask the board for two things:

1. A ranking of the versions V1 to V6.
2. A yes or no on each key decision below.

Based on this feedback we build 3 to 4 revised versions.

## The versions

All PDFs show the same example paper. Page 1 shows most of the differences.

| Version | What it is | PDF |
|---|---|---|
| V0 | The CHIL 2027 template as it is today, for comparison | [V0-current.pdf](V0-current.pdf) |
| V1 | One shared template for CHIL and ML4H, same look as today | [V1-harmonized.pdf](V1-harmonized.pdf) |
| V2 | V1 plus a new author block | [V2-useful-minimum.pdf](V2-useful-minimum.pdf) |
| V3 | V2 plus sans-serif headings and a light refresh | [V3-sans-headings.pdf](V3-sans-headings.pdf) |
| V4 | V3 with a modern font (STIX Two) and the classic layout | [V4-modern-font.pdf](V4-modern-font.pdf) |
| V5 | V4 plus an own title design | [V5-modern-design.pdf](V5-modern-design.pdf) |
| V6 | V5 in one column | [V6-modern-design-one-column.pdf](V6-modern-design-one-column.pdf) |

## Key decisions

| # | Decision | Look at |
|---|---|---|
| 1 | **New author block:** names side by side, numbered affiliations below, emails only for corresponding authors in a footnote? | V1 and V2, page 1 |
| 2 | **ORCID links** next to author names: no, optional or expected? | V2, page 1 |
| 3 | **Sans-serif headings?** | V2 and V3 |
| 4 | **A modern font (STIX Two)?** It was made by scientific publishers for papers. Text and equations use the same font. It is open source and looks like a cleaner Times, so it stays familiar. | V3 and V4 |
| 5 | **An own title design** with a left-aligned title and authors? | V4 and V5, page 1 |
| 6 | **One column or two columns?** One column needs roughly 40 percent more pages for the same content, so page limits would change. | V5 and V6 |
| 7 | **Accessibility:** require a short text description (alt text) for every figure now, and aim for fully accessible PDFs once the LaTeX tools support our template? | All versions |

## Already built into the prototypes

Please tell us if you object to any of these.

- **One code base** for CHIL and ML4H, built on the official PMLR class without edits. Year, tracks and page limits are settings in one place. (from V1)
- **Same rules for both venues:** required sections (data and code, IRB, AI usage) at the end of the paper and outside the page limit. AI usage statement also for ML4H. No keywords. This follows CHIL 2027. (from V1)
- **Automatic review version:** line numbers on. Authors, acknowledgments and copyright line hidden. (from V1)
- **No page range** in the PMLR header, as in ML4H 2026. (from V1)
- **Long author lists in references** are shortened automatically: first 10 authors, then "et al.". (from V2)
- **Preprint version** for arXiv. (from V2)
- **Links in AHLI blue,** the blue of the AHLI logo. (from V3)
- **Appendix** on a new page and in one column. (from V3)

## Good to know

- **PMLR:** all versions use the official PMLR class. We should confirm the new font with PMLR before a final decision.
- **Old papers:** from V2 on, the author block uses new commands. Papers written with an old template retype the author block once.
- **Accessibility:** fully accessible (tagged) PDFs are not possible yet. Line numbers and algorithms are not supported by the LaTeX tagging tools. A unified and maintained template is the base to add this later in one place.
- **Not yet done:** shorter and clearer instructions in the sample paper. Tests on Overleaf and with real papers from past years.

The full list of changes is in [CHANGES.md](../CHANGES.md).

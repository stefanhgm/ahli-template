# AHLI LaTeX template for CHIL and ML4H

Prototypes for a new shared LaTeX template for [CHIL](https://chil.ahli.cc/) and [ML4H](https://ahli.cc/ml4h/). Both venues publish with PMLR.

**Status:** first round of prototypes for the AHLI board. Nothing here is final.

## The versions

All PDFs show the same example paper. Page 1 shows most of the differences.

| Version | What it is | PDF |
|---|---|---|
| V0 | The CHIL 2027 template as it is today, for comparison | [PDF](board/V0-current.pdf) |
| V1 | One shared template for CHIL and ML4H, same look as today | [PDF](board/V1-harmonized.pdf) |
| V2 | V1 plus a new author block | [PDF](board/V2-useful-minimum.pdf) |
| V3 | V2 plus sans-serif headings and a light refresh | [PDF](board/V3-sans-headings.pdf) |
| V4 | V3 with a modern font (STIX Two) and the classic layout | [PDF](board/V4-modern-font.pdf) |
| V5 | V4 plus an own title design | [PDF](board/V5-modern-design.pdf) |
| V6 | V5 in one column | [PDF](board/V6-modern-design-one-column.pdf) |

## For the board

The key decisions are in [board/DECISIONS.md](board/DECISIONS.md). It is one page.

## More detail

| Where | What |
|---|---|
| [CHANGES.md](CHANGES.md) | Every change with its reason |
| [variants/](variants/) | The LaTeX files of V1 to V5. V6 is V5 without `twocolumn`. |
| [tools/build-board.sh](tools/build-board.sh) | Rebuilds all PDFs in `board/` |
| `CHIL_*`, `ML4H_*` | Past templates, unchanged |
| [references/](references/) | Templates of other venues, for comparison |

# Milestone One — Build Guide

## Project structure

```
milestone_one/
├── Makefile                        # Build both templates (recommended entry point)
├── milestone_one.tex               # Springer Nature journal template
├── milestone_one_minimal.tex       # Minimalist academic template
├── sections/                       # Shared section files (used by both templates)
│   ├── 01-intro.tex               # Research question & significance, context
│   ├── 02-methods.tex             # Proposed methods
│   ├── 03-preprocessing.tex       # Data & preprocessing
│   ├── 04-diagram.tex             # Information flow diagram
│   ├── 05-setup.tex               # Experimental setup & baselines
│   └── 06-timeline.tex            # Timeline to Milestone 2
├── assets/
│   └── info-flow-diagram.jpg
├── references.bib                  # Bibliography (BibTeX format)
├── sn-jnl.cls                     # Springer Nature journal class
├── sn-mathphys-num.bst            # Springer numbered bibliography style
└── out/                           # All generated PDFs and build artefacts
    ├── milestone_one_minimal.pdf  # Minimalist template output
    └── milestone_one.pdf          # Springer template output
```

## Quick start

```bash
make            # Build both templates (default)
make minimal    # Build minimalist template only
make springer   # Build Springer template only
make open       # Build all and open PDFs (macOS)
make clean      # Remove all generated files in out/
```

All PDFs are written to `out/`.

## Templates

### Minimalist (`milestone_one_minimal.tex`)

- `article` class, `newtxtext`/`newtxmath` (Times Roman), 2 cm margins
- Navy accent rules and small-caps section headings via `titlesec`
- `microtype` for improved justification (no overfull hboxes)
- Space-optimised: compact title block, tight section spacing, bibliography `bibsep=3pt`
- Output: ~6 pages (≈3 body + 3 references)

### Springer Nature (`milestone_one.tex`)

- `sn-jnl` class with `sn-mathphys-num` numbered reference style
- Standard Springer journal formatting with author-affiliation block
- Output: ~9 pages

Both templates share the same `sections/*.tex` files. Edit those files to update content in both outputs simultaneously.

## Manual compilation (without Make)

```bash
# Minimalist template
latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode' -bibtex \
        -outdir=out milestone_one_minimal.tex

# Springer template
latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode' -bibtex \
        -outdir=out milestone_one.tex
```

## Editing workflow

1. **Edit section files** in `sections/` — changes appear in both templates on next build.
2. **Update references** in `references.bib` using BibTeX format.
3. **Recompile** with `make` or `make minimal` / `make springer`.

### Version control

Commit `.tex` and `.bib` files. The `out/` directory is build output — keep it out of git
(add to `.gitignore` if desired). Exception: `milestone_one.bbl` is tracked because the
Springer template reads it from the project root during the `latexmk` run.

## Common LaTeX commands

| Purpose              | Command               |
|---------------------|-----------------------|
| Section (no number) | `\section*{Title}`    |
| Italic text         | `\textit{...}`        |
| Bold text           | `\textbf{...}`        |
| Citation            | `\cite{bib1}`         |
| Math inline         | `$...$`               |
| Math display        | `\[...\]`             |

## Troubleshooting

### `! Undefined control sequence. \bibcommenthead`
Springer's `.bst` emits `\bibcommenthead` unconditionally. The minimalist template
defines it as a no-op. If this error occurs, verify `\providecommand{\bibcommenthead}{}`
is in the preamble of `milestone_one_minimal.tex`.

### `! Command \Bbbk already defined`
Conflict between `newtxmath` and `amssymb`/`amsfonts`. The minimal template loads only
`amsmath`; do not add `amssymb` or `amsfonts` explicitly.

### Bibliography not appearing
Latexmk runs bibtex automatically. If citations are `[?]`, run:
```bash
make clean && make minimal
```

### Image not found
Check the path is relative from `milestone_one*.tex`. Use `assets/info-flow-diagram.jpg`.

### `! Package babel Error: Unknown language 'english'`
Install or update TeX Live: `tlmgr update --all`

---

**Last updated:** March 2026

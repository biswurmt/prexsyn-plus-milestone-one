# Milestone One — Build System
#
# Builds two PDF drafts from the same section sources:
#   milestone_one_minimal.pdf  — minimalist academic template (space-optimised)
#   milestone_one.pdf          — Springer Nature journal template
#
# Usage:
#   make            build both templates (default)
#   make minimal    build minimalist template only
#   make springer   build Springer template only
#   make open       build all and open PDFs (macOS)
#   make clean      remove all generated files in $(OUTDIR)

LATEXMK  := latexmk
FLAGS    := -pdf -pdflatex='pdflatex -interaction=nonstopmode' -bibtex
OUTDIR   := out

SPRINGER := milestone_one
MINIMAL  := milestone_one_minimal

SECTIONS := $(wildcard sections/*.tex)

.PHONY: all springer minimal open clean

all: minimal springer

# ── Minimalist template ───────────────────────────────────────────────────────
minimal: $(OUTDIR)/$(MINIMAL).pdf

$(OUTDIR)/$(MINIMAL).pdf: $(MINIMAL).tex references.bib $(SECTIONS)
	mkdir -p $(OUTDIR)
	$(LATEXMK) $(FLAGS) -outdir=$(OUTDIR) $(MINIMAL).tex

# ── Springer template ─────────────────────────────────────────────────────────
springer: $(OUTDIR)/$(SPRINGER).pdf

$(OUTDIR)/$(SPRINGER).pdf: $(SPRINGER).tex references.bib $(SECTIONS)
	mkdir -p $(OUTDIR)
	$(LATEXMK) $(FLAGS) -outdir=$(OUTDIR) $(SPRINGER).tex

# ── Open PDFs (macOS) ─────────────────────────────────────────────────────────
open: all
	open $(OUTDIR)/$(MINIMAL).pdf $(OUTDIR)/$(SPRINGER).pdf

# ── Clean ─────────────────────────────────────────────────────────────────────
clean:
	$(LATEXMK) -C -outdir=$(OUTDIR) $(MINIMAL).tex 2>/dev/null || true
	$(LATEXMK) -C -outdir=$(OUTDIR) $(SPRINGER).tex 2>/dev/null || true

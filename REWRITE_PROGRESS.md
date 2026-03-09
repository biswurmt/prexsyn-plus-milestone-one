# Milestone One Rewrite Progress

**Status:** In Progress
**Target:** Submission-ready reconstruction
**Standards:** Exacting, rhetorically talented, meticulous

## Phase 1: New Draft Generation
- [x] Read all context documents and existing sections
- [x] Draft 01-intro.tex (new)
- [x] Draft 02-methods.tex (new)
- [x] Draft 03-preprocessing.tex (new)
- [x] Draft 04-diagram.tex (new)
- [x] Draft 05-setup.tex (new)
- [x] Draft 06-timeline.tex (new)
- **Status:** Complete
- **Commit:** ba314e4

## Phase 2: Information Loss Verification
- [x] Extract fact list from existing sections
- [x] Cross-reference with new draft
- [x] Reconciliation audit (zero loss confirmed)
- [x] Revise if needed (none required)
- **Status:** Complete — all 40+ quantitative facts, citations, design decisions preserved

## Phase 3–7: Editing Passes
- Pass 1: Narrative Structure & Core Argument — Complete (3915f42)
- Pass 2: Drug Discovery Payoff & Practical Framing — Complete (60d4918)
- Pass 3: Methodological Rigor & Critical Clarity — Complete (66e9e60)
- Pass 4: Quantification & Metric Confidence — Complete (2fbfa1b)
- Pass 5: Style Enforcement & Final Polish — Complete (62a4a76)

## Final Status: COMPLETE
PDF compiles cleanly at 9 pages. All checklist items verified:
- No em dashes, anthropomorphism, or filler
- All 40+ facts preserved
- Drug discovery payoff explicit in every section
- All jargon defined on first use (ECFP4, Tanimoto, desirability, context radius, junction tree, ESPsim, retrosynthetic analysis, R-group, ETKDG, scaffold hopping, MMP)
- Active voice throughout methodology
- All thresholds stated with confidence (no hedging)
- Complementarity assumption explicitly addressed
- AiZynthFinder depth choice justified
- ReactEA definitively absent

## Key Constraints
- Four methods only: CReM, mmpdb, JT-VAE, LibINVENT (ReactEA dropped)
- 100 ChEMBL-derived specs (pre-stratified, 25 per bin)
- Repeated PrexSyn sampling as baseline
- Four evaluation criteria: synthesizability, substructural conservation, physicochemical conservation, ESPsim (supplementary)
- Stratification by baseline quality bins
- Complementarity analysis for method combinations

## Files Under Rewrite
- sections/01-intro.tex
- sections/02-methods.tex
- sections/03-preprocessing.tex
- sections/04-diagram.tex
- sections/05-setup.tex
- sections/06-timeline.tex
- references.bib (add QED citation)

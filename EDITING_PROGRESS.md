# Milestone One Editing Progress

**Status:** Complete (updated with professor/TA feedback)
**Target Completion:** Full document submission-ready

## Pass 1: Style Enforcement & Jargon Elimination
- [x] Em dashes eliminated (none found; en-dashes for ranges preserved)
- [x] Anthropomorphism removed (none found in existing text)
- [x] Filler words purged (none found; "inherent" is precise, not filler)
- [x] Jargon explained: ECFP4 Tanimoto, matched molecular pairs, context radius, junction trees, canonical SMILES, retrosynthetic analysis, scaffold, geometric mean
- [x] Chemistry intuitions added for all modification methods (principle before name)
- [x] ReactEA added as fifth method across all sections with citation
- **Commit:** `docs: pass 1 - eliminate jargon gaps, add ReactEA, strengthen chemistry intuition`

## Pass 2: Drug Discovery Payoff & Explicit Framing
- [x] Introduction motivates drug discovery problem (72% gap, practical reach)
- [x] Methods explain practical value: CReM (lead optimization), JT-VAE (scaffold hopping/IP), mmpdb (medicinal chemistry standard)
- [x] Evaluation metrics justified by drug discovery relevance (expansion factor, diversity, stratification)
- [x] Complementarity positioned as tool for pipeline design
- [x] Stratification connected to practical pipeline decisions (rescue vs. expansion tool)
- **Commit:** `docs: pass 2 - strengthen drug discovery payoff; make motivation explicit throughout`

## Pass 3: Quantification & Metric Confidence
- [x] "Substantial pharmacologically relevant chemistry" replaced with exact 72% figure
- [x] Hedging footnote about ECFP4 vs full descriptor set removed (stated with confidence)
- [x] Threshold choices stated with confidence at multiple levels
- [x] Tolerance values explicit (MW +/-50 Da, CLogP +/-1.0, etc.)
- [x] Geometric mean rationale explained (single violation dominates)
- **Commit:** `docs: pass 3 - replace qualitative adjectives with exact metrics; state choices with confidence`

## Pass 4: Methodological Rigor & Red Flags
- [x] Baseline fairness: pilot saturation study ensures fair comparison at diversity plateau
- [x] Confounded evaluation: ESPsim demoted to supplementary diagnostic with explicit rationale
- [x] Generalization scope: Enamine REAL characterized as specific commercial subset
- [x] Method selection rationale: "~50 candidate methods" reviewed, selection criteria stated
- [x] Seed diversity: K=1 justified for clean attribution; top-K noted as natural extension
- [x] Synthesizability depth: depth-1 primary, depth-2 sensitivity on 10% subsample
- [x] Information leakage: ChEMBL overlap addressed (property sources, not targets)
- **Commit:** `docs: pass 4 - flag methodological ambiguities; strengthen baseline fairness, scope`

## Pass 5: Narrative Flow & Integrative Polish
- [x] Story arc coherent: problem -> gap -> approach -> methods -> evaluation -> timeline
- [x] Complementarity discussion consolidated (two paragraphs merged)
- [x] ECFP4 explanation restructured for smoother flow
- [x] JT-VAE scaffold hopping sentence improved (parenthetical)
- [x] Final style check: no em dashes, no anthropomorphism, no banned filler
- **Commit:** `docs: pass 5 - refine narrative flow; consolidate complementarity discussion; final polish`

## Key Files Edited
- `milestone_one.tex` (abstract updated)
- `sections/01-intro.tex`
- `sections/02-methods.tex`
- `sections/03-preprocessing.tex`
- `sections/05-setup.tex`
- `sections/06-timeline.tex`
- `milestone_one.bbl` (ReactEA citation added)

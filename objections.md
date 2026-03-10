# Internal Objections Log

---

## Objection 1: Space expansion vs. property optimization

**Source passage (Proposed methods):**
> "We investigate whether post-generation molecular modification expands the space of viable candidates when composed with the frontier synthesis-aware model."

**Concern:** Is the objective really space expansion, or is it property optimization? Space expansion is implicitly achieved, but the ultimate goal is still property optimization. Focusing on space expansion implies we're trying to improve the ChEMBL 28% metric.

**Resolution: The framing is correct. This is expansion, not optimization.**

Property optimization means taking one molecule and making it better along some axis. That is not what we do. We generate *more* molecules that meet a fixed property specification. That is expansion of the viable candidate set. The 28% ChEMBL number motivates *why* expansion matters (PrexSyn cannot reach most of pharmacologically validated space), but we do not claim to close that gap directly. Our expansion factor metric measures something precise: unique hits from a modification method that repeated sampling does not produce. That is new chemical territory, not a better version of an existing candidate.

The abstract now reflects this clearly: "We investigate whether post-generation modification methods can extend this reach while preserving synthesizability."

**Status:** Resolved. No further action needed.

---

## Objection 2: Fairness of the repeated-sampling baseline

**Source passage (Proposed methods):**
> "This repeated-sampling baseline establishes what PrexSyn alone achieves with more compute, so we evaluate each modification method by how many viable candidates it produces that repeated sampling cannot."

**Concern:** If PrexSyn already saturates at ~256 samples (Table 1 shows marginal improvement beyond that), is it fair to compare modification methods against additional samples? The baseline is known to be weak.

**Resolution: The baseline is the right comparison, and its weakness is the finding, not a flaw.**

The practical question a pipeline designer faces is: "I have compute budget. Should I spend it on more PrexSyn samples, or on modification?" Repeated sampling is the natural alternative use of compute. That it saturates is exactly what makes modification methods potentially valuable. A weak baseline does not make the comparison unfair; it makes the comparison informative. If anything, the design is generous to PrexSyn: it gets N additional draws from a distribution we already know plateaus.

A reviewer could ask for additional baselines (e.g., sampling from a different generative model). That is a fair extension but outside our scope. Repeated sampling is the primary comparison we need, and the one most relevant to practitioners deciding how to allocate compute within a PrexSyn-based pipeline.

**Status:** Resolved. No further action needed.

---

## Objection 3: "We're just benchmarking lead optimization"

**Source passage (Proposed methods):**
> "No prior work benchmarks modification methods as post-generation complements to synthesis-aware generation."

**Concern (multi-part):**
1. This feels like we're just benchmarking lead optimization on generative model outputs, which is what people already do in practice.
2. It's not clear why PrexSyn is necessary. Why can't we start from arbitrary hits?
3. If post-modification improves PrexSyn outputs, that's a foregone conclusion, because lead optimization algorithms are designed to improve hits.
4. The fundamental goal may just be "benchmarking post-molecular modification algorithms on synthesizable hits/leads."

**Resolution: The synthesizability constraint is what makes this distinct, and the outcome is not a foregone conclusion.**

The concern is understandable but conflates two different things: property improvement and synthesizability-preserving expansion.

Generic lead optimization benchmarks optimize properties and worry about synthesis later. Our study imposes a hard synthesizability gate: every variant must pass retrosynthetic verification via AiZynthFinder. This is not a formality. Modification methods routinely produce molecules that are property-improved but unsynthesizable. The empirical question, which has no known answer, is what fraction of modified variants survive the synthesizability gate while also conserving target properties. That fraction could be near-zero for some methods (making them useless in this context), or high (making them valuable pipeline components). We do not know yet.

On why PrexSyn is necessary: it provides synthesizable-by-construction starting points. Starting from arbitrary ChEMBL hits gives you molecules that may or may not be synthesizable, confounding the analysis. PrexSyn's guarantee isolates the question: when you modify a *known-synthesizable* molecule, does the result remain synthesizable? That is a clean experimental design.

On the "foregone conclusion" worry: it would be a foregone conclusion if we only measured property improvement. We do not. We measure how many variants are *both* property-conserving *and* synthesizable. These are competing pressures: bigger modifications access more chemical territory but are more likely to break synthesizability. The tradeoff is the finding.

On point 4 ("the fundamental goal is benchmarking modification algorithms on synthesizable hits"): this is actually a fair description of what we do, and it is a contribution. Nobody has done it. The fact that it sounds like something people *should* already be doing is an argument for the work, not against it. Systematic benchmarks of obvious-sounding comparisons are how the field makes empirical progress.

**Status:** Resolved. The framing edits to the abstract, intro, and methods (commit `fcd6d09`) address this by foregrounding the synthesizability tension throughout the manuscript.

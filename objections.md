# Objection 1

Section: Proposed methods

"We investigate whether post-generation molecular modification expands the space of viable candidates when composed with the frontier synthesis-aware model."

Is our objective necessarily space expansion, or is it property optimization? Space expansion is implicitly achieved but I feel the ultimate goal is still property optimization. Focusing on space expansion implies improving ChEmbl 28% metric

# Objection 2

Section: Proposed methods

"This repeated-sampling baseline establishes what PrexSyn alone achieves with more compute, so we evaluate each modification method by how many viable candidates it produces that repeated sampling cannot."

If we're already taking the best hit after about ~256 (default) PrexSyn samples and optimizing it, then is it really fair to compare against additional samples? We already see the improvement is highly marginal from PrexSyn table 1 as sampling levels increase

# Objection 3

Section: Proposed methods

"No prior work benchmarks modification methods as post-generation complements to synthesis-aware generation. Our complementarity analysis further identifies which combinations maximize total unique-hit coverage, informing pipeline design for medicinal chemistry and automated discovery."

If we're already taking the best hit after about ~256 (default) PrexSyn samples and optimizing it, then is it really fair to compare against additional samples? We already see the improvement is highly marginal from PrexSyn table 1 as sampling levels increase

This still feels a bit iffy since it feels like we're just benchmarking lead optimization approaches on the outputs of a generative model. It's not clear why PrexSyn is necessary here; for example, why can't we just start from potential hits? If we argue that post-modification improves PrexSyn outputs, then that's because we're implementing lead optimization algorithms on a hit generation tool so it's a foregone conclusion that results will be better

I guess my concern is that what we're doing is what people would normally do when building a computational drug discovery pipeline in practice

They would specify input specifications (ideally with a known target), PrexSyn would output hits, then they would run lead optimization algorithms, in which case they would do their own testing (benchmarking) across the various lead optimization approaches

The project as-is achieves the current goal of informing pipeline decisions, but I think the fundamental goal is "benchmarking post-molecular modification algorithms on synthesizable hits/leads"

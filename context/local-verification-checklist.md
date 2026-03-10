# Local verification checklist

Claims verifiable during environment setup (week 1). No literature search needed.

## PrexSyn specifics (check `context/prexsyn-paper/`)

- [ ] 94% Enamine REAL reconstruction, 28% ChEMBL — exact figures and metric used (top-1? Tanimoto threshold?)
- [ ] ~480,000 building blocks, 115 reaction templates — exact counts
- [ ] ~0.26 s throughput — confirm hardware conditions (GPU, batch size)
- [ ] Input format: ECFP4 fingerprint + which descriptors exactly? Cross-check Table 3. Aromatic ring count appears in pseudocode but not methods text — resolve
- [ ] 256 candidates per spec — supported parameter or hardcoded?
- [ ] Pretrained checkpoint publicly available and runnable?

## Method APIs (check docs/repos during setup)

- [ ] **CReM:** Accepts single SMILES, returns SMILES variants. Context radius as parameter (1/2/3). Fragment DB ships pre-built or must be built? Confirm DB is ChEMBL-derived
- [ ] **mmpdb:** "Transform" operation works on novel molecules not in training pairs? Returns SMILES? Property-delta annotations available out-of-box or need computation?
- [ ] **JT-VAE:** Pretrained model exists and runs on current PyTorch/RDKit? Latent perturbation workflow documented (perturbation magnitude)?
- [ ] **LibINVENT/REINVENT4:** Accepts external scaffold from PrexSyn? Scaffold definition (Murcko? user-defined?) matches what we extract? RL scoring steerable toward arbitrary property targets?
- [ ] **Each method:** Can it generate 500+ variants from a single seed? What bounds output count?

## AiZynthFinder (check docs/code during setup)

- [ ] Configurable against Enamine + ZINC stocks simultaneously? ZINC stock files available in right format?
- [ ] Default expansion policy model — confirm it's USPTO-trained. Version? Separate download?
- [ ] Depth-1 vs depth-2 speed ratio — measure empirically on 10 molecules
- [ ] Throughput estimate: molecules/minute at depth 1 on available hardware. Is ~80K feasible in the timeline? Parallelization options?

## Arithmetic and design

- [ ] 80K unique molecules estimate: 100 specs × 4 methods × N variants + baseline. Check math at expected N. Is deduplication assumption realistic?
- [ ] Pilot saturation study: 5 specs sufficient to set N? Consider 10–20 if variance across methods/bins is high
- [ ] Pre-stratification: does ChEMBL baseline quality distribution have enough mass in <0.5 bin to fill ~25 specs?
- [ ] Hit rate denominator: "synthesizable variants meeting thresholds / all synthesizable variants" — confirm this is intentional, not "/ all variants"
- [ ] Desirability tolerances (MW ±50, CLogP ±1.0, TPSA ±20, HBD ±1, HBA ±2, RotBonds ±2) — sanity-check against medicinal chemistry conventions

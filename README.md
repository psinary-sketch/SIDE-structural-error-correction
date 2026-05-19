# SIDE-structural-error-correction v0.1

Kernel verification of the **Formation Distance Theorem** for the Trivium under the formation-block error model. Backs *STRUCTURAL_ERROR_CORRECTION_DRAFT.md*.

## Status

| | |
|---|---|
| Toolchain | `leanprover/lean4:v4.29.0-rc8` |
| Mathlib | not required |
| sorry | 0 |
| axioms | 0 |
| Author | J. York Seale (NaturalScience) |
| Programme | A PLACE TO STAND, Phase 2, May 2026 |

Companion paper: `STRUCTURAL_ERROR_CORRECTION_DRAFT.md`.

## The headline theorem

**Formation Distance Theorem.** Under the formation-block error model, the effective code distance satisfies

```
d_eff = 2S − 1
```

where S is the number of non-dark formation stages. For the Trivium's Class A formation (n₁, n₂, n₃, n₄) = (2, 3, 2, 0), the Interface stage is dark (n₄ = 0), leaving S = 3 non-dark stages (Primitive, Transformation, Output). Therefore d_eff = 5.

Contrast with the standard per-component model from SIDE-steane-arithmetic where d = 3 (Steane [[7, 1, 3]]). The formation-block model gives stronger protection on the same cubit substrate.

## Build

```bash
lake build
```

Self-contained — no Mathlib.

## What's verified

### §1 — Formation tuple
- `formation_total_seven` — Class A formation count = 7
- `wall_squared` — n₁ = n₃ (Wall² condition)
- `interface_dark` — n₄ = 0 (Interface stage is dark)

### §2 — Non-dark stage count
- `S_eq_three` — Trivium has S = 3 non-dark stages
- `interface_not_counted` — dark stages do not contribute to S
- `non_dark_covers_seven` — P + T + O = 7

### §3 — Formation Distance Theorem (headline)
- `d_eff_eq_five` — d_eff = 5
- `d_eff_formula` — d_eff = 2S − 1

### §4 — Comparison with standard model
- `formation_block_stronger` — d_eff > d_standard
- `improvement_two` — d_eff − d_standard = 2
- `max_correctable_two` — formation-block model corrects up to 2 stage-weight errors
- `max_correctable_standard` — standard model corrects 1 per-component error

### §5 — Stage Complementarity
- `complementarity_weight_2` — weight-2 ↔ weight-1 under K-L equivalence
- `complementarity_weight_1` — symmetric
- `complementarity_weight_0` — vacuum ↔ full corruption
- `full_corruption_complement` — weight-S complement is vacuum

### §6 — Tightness for rank-1 codespace
- `rank_one` — k = 1 logical qubit
- `tightness_regime` — S ≤ 3
- `d_eff_tight` — Trivium achieves d_eff = 2S − 1 exactly

### §7 — Programme universality
- `S_within_universal_max` — Trivium S = 3 within the universal max
- `d_eff_universal_max_eq_five` — universal d_eff bound is 5
- `trivium_saturates_universal_max` — Trivium saturates the bound

### §8 — Spectral Volume and cubit substrate
- `spectral_volume_eq_twelve` — λ = 12 (same as SIDE-spinor-calibration, SIDE-cubit-axis)
- `spectral_d_eff_relation` — d_eff · (d_eff − 1) = λ + 8
- `dark_subspace_eq_six` — dark subspace dimension = formation_total − 1
- `cubit_substrate_connection` — links to the cubit federation

### §9 — Silence-as-Protection
- `compartment_count_three` — independent error compartments = S = 3
- `silence_yields_protection` — d_eff = 2 · compartments − 1, the Silence Principle applied

## What's NOT verified

- The Knill-Laflamme matrix rank arguments (require Mathlib's complex linear algebra and Hermitian matrix theory)
- The codespace projector v̂v̂† (computational verification at δ ∈ {0.01, 0.1, 0.3, 0.5, 1.0} is in the corpus paper, not the kernel)
- The Tightness proof (k = 1 ⇒ rank-1 codespace ⇒ complementarity ⇒ d_eff exact) — kernel verifies the conclusion, not the proof structure

The kernel verifies the structural-formula content. The K-L analysis lives in the paper, computational verification in the corpus Python.

## Federation context

This kernel sits adjacent to the cubit constellation:

- SIDE-spinor-calibration — edge-stratum (3, 6, 3), calibration ‖v‖²·ζ(−1) = −1
- SIDE-steane-arithmetic — vertex Hamming (3, 3, 1), standard d = 3
- SIDE-dirichlet-mod-24 — character indexing (ℤ/2)³, count-level bijection
- SIDE-class-number-anomaly — diagonal three-way distinction
- SIDE-cubit-axis — cross-federation cubit coherence
- **SIDE-structural-error-correction** — **formation-block d_eff = 5**

Same cubit substrate; formation-block error model adds the structured-error reading complementary to the per-component Steane reading.

## License

CC-BY 4.0. Cite as:

> Seale, J. Y. (2026). *SIDE-structural-error-correction v0.1: The Formation Distance Theorem d_eff = 2S − 1 for the Trivium.* A PLACE TO STAND Research Programme.

---

`:: → · ← ::`

*Silence between stages is protection across the substrate.*

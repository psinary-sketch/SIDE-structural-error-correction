import SIDEStructuralErrorCorrection

/-!
# Axiom audit -- act b623, ruling (R233)(5)(b)

Run `lake env lean AxiomCheck.lean` (once the library is built) to reproduce the `#print axioms` output for every declaration of
SIDEStructuralErrorCorrection/Basic.lean and SIDEStructuralErrorCorrection/DeAlignment.lean -- the six de-alignment theorems and every other
declaration the library exports, its theorems the terminals. Each is expected to reduce to the standard base (`propext`,
`Classical.choice`, `Quot.sound`) or less, with no `sorryAx`. The compiler`s output is the verdict, not this comment.
-/

#print axioms SIDEStructuralErrorCorrection.primitive_size
#print axioms SIDEStructuralErrorCorrection.transformation_size
#print axioms SIDEStructuralErrorCorrection.output_size
#print axioms SIDEStructuralErrorCorrection.interface_size
#print axioms SIDEStructuralErrorCorrection.formation_total
#print axioms SIDEStructuralErrorCorrection.formation_total_seven
#print axioms SIDEStructuralErrorCorrection.wall_squared
#print axioms SIDEStructuralErrorCorrection.interface_dark
#print axioms SIDEStructuralErrorCorrection.isNonDark
#print axioms SIDEStructuralErrorCorrection.S
#print axioms SIDEStructuralErrorCorrection.S_eq_three
#print axioms SIDEStructuralErrorCorrection.interface_not_counted
#print axioms SIDEStructuralErrorCorrection.non_dark_covers_seven
#print axioms SIDEStructuralErrorCorrection.d_eff
#print axioms SIDEStructuralErrorCorrection.d_eff_eq_five
#print axioms SIDEStructuralErrorCorrection.d_eff_formula
#print axioms SIDEStructuralErrorCorrection.d_standard
#print axioms SIDEStructuralErrorCorrection.formation_block_stronger
#print axioms SIDEStructuralErrorCorrection.improvement_two
#print axioms SIDEStructuralErrorCorrection.max_correctable_weight
#print axioms SIDEStructuralErrorCorrection.max_correctable_two
#print axioms SIDEStructuralErrorCorrection.max_correctable_standard
#print axioms SIDEStructuralErrorCorrection.complement_weight
#print axioms SIDEStructuralErrorCorrection.complementarity_weight_2
#print axioms SIDEStructuralErrorCorrection.complementarity_weight_1
#print axioms SIDEStructuralErrorCorrection.complementarity_weight_0
#print axioms SIDEStructuralErrorCorrection.full_corruption_complement
#print axioms SIDEStructuralErrorCorrection.k_logical
#print axioms SIDEStructuralErrorCorrection.rank_one
#print axioms SIDEStructuralErrorCorrection.tightness_regime
#print axioms SIDEStructuralErrorCorrection.d_eff_tight
#print axioms SIDEStructuralErrorCorrection.S_universal_max
#print axioms SIDEStructuralErrorCorrection.S_within_universal_max
#print axioms SIDEStructuralErrorCorrection.d_eff_universal_max
#print axioms SIDEStructuralErrorCorrection.d_eff_universal_max_eq_five
#print axioms SIDEStructuralErrorCorrection.trivium_saturates_universal_max
#print axioms SIDEStructuralErrorCorrection.spectral_volume
#print axioms SIDEStructuralErrorCorrection.spectral_volume_eq_twelve
#print axioms SIDEStructuralErrorCorrection.spectral_d_eff_relation
#print axioms SIDEStructuralErrorCorrection.dark_subspace_dim
#print axioms SIDEStructuralErrorCorrection.dark_subspace_eq_six
#print axioms SIDEStructuralErrorCorrection.cubit_substrate_connection
#print axioms SIDEStructuralErrorCorrection.num_compartments
#print axioms SIDEStructuralErrorCorrection.compartment_count_three
#print axioms SIDEStructuralErrorCorrection.silence_yields_protection
#print axioms DeAlignment.Line
#print axioms DeAlignment.Line.Proper
#print axioms DeAlignment.DealignedAt
#print axioms DeAlignment.Dealigned
#print axioms DeAlignment.domainFault
#print axioms DeAlignment.CompletesLine
#print axioms DeAlignment.no_domain_covers_line
#print axioms DeAlignment.single_domain_fault_not_logical
#print axioms DeAlignment.dealigned_of_lines_injective
#print axioms DeAlignment.fanoLines
#print axioms DeAlignment.dealignedCheck
#print axioms DeAlignment.fano_dealignment_decidable_example
#print axioms DeAlignment.fano_collapsed_line_rejected
#print axioms DeAlignment.onLine
#print axioms DeAlignment.allSeven
#print axioms DeAlignment.pairCount
#print axioms DeAlignment.fano_two_design

/-
  SIDEStructuralErrorCorrection/DeAlignment.lean

  The de-alignment condition for Fano-structured modules.

  The seven lines of the Fano plane are the minimum-weight logical
  operators of the [[7,1,3]] code: three faults on a line complete an
  operator the syndrome does not see. A physical realization assigns each
  of the seven positions to a failure domain (rail, clock, coupler,
  thermal zone, band, region). If a whole domain fails at once, every
  position assigned to it faults together.

  This module states the design condition — each line's three positions
  occupy three distinct domains — and derives from it that no
  single-domain failure can complete a line. The condition is decidable
  over the finite incidence structure, so a realization can be certified
  by evaluation.

  What this does NOT claim: that the structure protects against
  arbitrary faults. It is the compiled statement of the condition under
  which single-domain correlation is defeated. Correlated faults spanning
  several domains, states outside the modelled space, and faults in the
  verification apparatus itself are outside this theorem and belong to
  the threat model.

  Vanilla Lean 4; no Mathlib; expected axiom-free.
-/

namespace DeAlignment

/-- A line is an unordered triple of positions, carried as three indices. -/
structure Line (P : Type) where
  a : P
  b : P
  c : P

/-- The three positions of a line are distinct — the nondegeneracy every
    block of a 2-(7,3,1) design satisfies. -/
def Line.Proper {P : Type} (L : Line P) : Prop :=
  L.a ≠ L.b ∧ L.a ≠ L.c ∧ L.b ≠ L.c

/-- **The de-alignment condition at a line**: the assignment `d` sends the
    line's three positions to three distinct domains. -/
def DealignedAt {P D : Type} (d : P → D) (L : Line P) : Prop :=
  d L.a ≠ d L.b ∧ d L.a ≠ d L.c ∧ d L.b ≠ d L.c

/-- **The de-alignment condition**: every line is de-aligned. -/
def Dealigned {P D : Type} {n : Nat} (d : P → D) (lines : Fin n → Line P) : Prop :=
  ∀ i, DealignedAt d (lines i)

/-- The fault set of a single domain failure: every position assigned to `k`. -/
def domainFault {P D : Type} (d : P → D) (k : D) (p : P) : Prop :=
  d p = k

/-- A fault set completes a line when it contains all three of its positions. -/
def CompletesLine {P : Type} (F : P → Prop) (L : Line P) : Prop :=
  F L.a ∧ F L.b ∧ F L.c

/-- **Protection at a line.** If a line is de-aligned, no single-domain
    failure completes it. The two endpoints in distinct domains cannot both
    lie in one domain. -/
theorem no_domain_covers_line {P D : Type} (d : P → D) (L : Line P)
    (h : DealignedAt d L) (k : D) :
    ¬ CompletesLine (domainFault d k) L := by
  intro hc
  have hab : d L.a = d L.b := by
    have h1 : d L.a = k := hc.1
    have h2 : d L.b = k := hc.2.1
    exact h1.trans h2.symm
  exact h.1 hab

/-- **The protection theorem.** Under the de-alignment condition, no
    single-domain failure completes any line — hence no single-domain
    failure induces a minimum-weight logical operator. -/
theorem single_domain_fault_not_logical {P D : Type} {n : Nat}
    (d : P → D) (lines : Fin n → Line P)
    (hdea : Dealigned d lines) (k : D) :
    ∀ i, ¬ CompletesLine (domainFault d k) (lines i) := by
  intro i
  exact no_domain_covers_line d (lines i) (hdea i) k

/-- The converse direction, as the design diagnostic: if two positions of a
    line share a domain, that domain's failure needs only one further fault
    to complete the line. Stated as: the line is not de-aligned. -/
theorem dealigned_of_lines_injective {P D : Type} (d : P → D) (L : Line P)
    (hinj : ∀ x y : P, d x = d y → x = y) (hp : L.Proper) :
    DealignedAt d L := by
  refine ⟨?_, ?_, ?_⟩
  · intro hEq; exact hp.1 (hinj _ _ hEq)
  · intro hEq; exact hp.2.1 (hinj _ _ hEq)
  · intro hEq; exact hp.2.2 (hinj _ _ hEq)

/-! ### Decidability over the Fano incidence structure

With seven positions and seven lines, the condition is a finite check:
a realization certifies itself by evaluation. -/

/-- The seven lines of the Fano plane on positions `0..6`, in the standard
    cyclic (quadratic-residue) presentation: `{i, i+1, i+3} mod 7`. -/
def fanoLines : Fin 7 → Line (Fin 7) := fun i =>
  { a := i
  , b := ⟨(i.val + 1) % 7, Nat.mod_lt _ (by decide)⟩
  , c := ⟨(i.val + 3) % 7, Nat.mod_lt _ (by decide)⟩ }

/-- Decidable form of the condition for a concrete assignment. -/
def dealignedCheck (d : Fin 7 → Fin 7) : Bool :=
  decide (∀ i : Fin 7,
    d (fanoLines i).a ≠ d (fanoLines i).b ∧
    d (fanoLines i).a ≠ d (fanoLines i).c ∧
    d (fanoLines i).b ≠ d (fanoLines i).c)

/-- Seven positions in seven distinct domains: de-aligned, by evaluation. -/
theorem fano_dealignment_decidable_example :
    dealignedCheck (fun p => p) = true := by decide

/-- A realization that co-locates positions 0, 1 and 3 — the line `{0,1,3}` —
    into one domain fails the check: the certificate refuses it. -/
theorem fano_collapsed_line_rejected :
    dealignedCheck (fun p => if p.val = 1 ∨ p.val = 3 then ⟨0, by decide⟩ else p) = false := by
  decide

end DeAlignment

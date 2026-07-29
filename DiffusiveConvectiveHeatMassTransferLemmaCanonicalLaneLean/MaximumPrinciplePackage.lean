import DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean.PartialDifferentialEquationPackage

/-!
# Maximum Principle Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure MaximumPrinciplePackage (P : PDEPackage) where
  parabolicMaximumPrinciple : Prop
  comparisonPrinciple : Prop
  solutionBoundsFromData : Prop
  positivityPreservation : Prop
  boundaryMaximumPrinciple : Prop

structure MaximumPrincipleEvidence (P : PDEPackage) (M : MaximumPrinciplePackage P) where
  parabolicMaximumPrincipleClosed : M.parabolicMaximumPrinciple
  comparisonPrincipleClosed : M.comparisonPrinciple
  solutionBoundsFromDataClosed : M.solutionBoundsFromData
  positivityPreservationClosed : M.positivityPreservation
  boundaryMaximumPrincipleClosed : M.boundaryMaximumPrinciple

def MaximumPrincipleClosed (P : PDEPackage) (M : MaximumPrinciplePackage P) : Prop :=
  M.parabolicMaximumPrinciple ∧ M.comparisonPrinciple ∧
  M.solutionBoundsFromData ∧ M.positivityPreservation ∧ M.boundaryMaximumPrinciple

theorem maximum_principle_closed_from_evidence (P : PDEPackage) (M : MaximumPrinciplePackage P)
    (Ev : MaximumPrincipleEvidence P M) : MaximumPrincipleClosed P M := by
  exact And.intro Ev.parabolicMaximumPrincipleClosed
    (And.intro Ev.comparisonPrincipleClosed
      (And.intro Ev.solutionBoundsFromDataClosed
        (And.intro Ev.positivityPreservationClosed Ev.boundaryMaximumPrincipleClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
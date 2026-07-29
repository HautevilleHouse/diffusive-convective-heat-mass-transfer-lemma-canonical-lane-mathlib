import DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean.PartialDifferentialEquationPackage

/-!
# Finite Element Approximation Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure FiniteElementApproximationPackage (P : PDEPackage) where
  variationalFormulation : Prop
  discreteSpacesConstructed : Prop
  stabilityAnalysis : Prop
  errorEstimate : Prop
  convergenceRate : Prop

structure FiniteElementApproximationEvidence (P : PDEPackage) (F : FiniteElementApproximationPackage P) where
  variationalFormulationClosed : F.variationalFormulation
  discreteSpacesConstructedClosed : F.discreteSpacesConstructed
  stabilityAnalysisClosed : F.stabilityAnalysis
  errorEstimateClosed : F.errorEstimate
  convergenceRateClosed : F.convergenceRate

def FiniteElementApproximationClosed (P : PDEPackage) (F : FiniteElementApproximationPackage P) : Prop :=
  F.variationalFormulation ∧ F.discreteSpacesConstructed ∧
  F.stabilityAnalysis ∧ F.errorEstimate ∧ F.convergenceRate

theorem finite_element_approximation_closed_from_evidence (P : PDEPackage) (F : FiniteElementApproximationPackage P)
    (Ev : FiniteElementApproximationEvidence P F) : FiniteElementApproximationClosed P F := by
  exact And.intro Ev.variationalFormulationClosed
    (And.intro Ev.discreteSpacesConstructedClosed
      (And.intro Ev.stabilityAnalysisClosed
        (And.intro Ev.errorEstimateClosed Ev.convergenceRateClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
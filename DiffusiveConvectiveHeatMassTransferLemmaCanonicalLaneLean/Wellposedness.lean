/-!
# Well-posedness Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure WellposednessPackage {T : TransportEquationPackage}
    {B : BoundaryConditionsPackage T} {C : CoupledHeatMassTransferPackage B} where
  existenceOfSolution : Prop
  uniquenessOfSolution : Prop
  stabilityEstimates : Prop
  continuousDependence : Prop

structure WellposednessEvidence {T : TransportEquationPackage}
    {B : BoundaryConditionsPackage T} {C : CoupledHeatMassTransferPackage B}
    (W : WellposednessPackage C) where
  existenceOfSolutionClosed : W.existenceOfSolution
  uniquenessOfSolutionClosed : W.uniquenessOfSolution
  stabilityEstimatesClosed : W.stabilityEstimates
  continuousDependenceClosed : W.continuousDependence

def WellposednessClosed {T : TransportEquationPackage}
    {B : BoundaryConditionsPackage T} {C : CoupledHeatMassTransferPackage B}
    (W : WellposednessPackage C) : Prop :=
  W.existenceOfSolution ∧ W.uniquenessOfSolution ∧ W.stabilityEstimates ∧ W.continuousDependence

theorem wellposedness_closed_from_evidence {T : TransportEquationPackage}
    {B : BoundaryConditionsPackage T} {C : CoupledHeatMassTransferPackage B}
    (W : WellposednessPackage C) (E : WellposednessEvidence W) :
    WellposednessClosed W := by
  exact And.intro E.existenceOfSolutionClosed
    (And.intro E.uniquenessOfSolutionClosed
      (And.intro E.stabilityEstimatesClosed E.continuousDependenceClosed))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse

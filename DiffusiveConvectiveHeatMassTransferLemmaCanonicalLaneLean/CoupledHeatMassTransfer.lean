/-!
# Coupled Heat and Mass Transfer Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure CoupledHeatMassTransferPackage {T : TransportEquationPackage}
    (B : BoundaryConditionsPackage T) where
  soretEffect : Prop
  dufourEffect : Prop
  crossDiffusionCoefficients : Prop
  couplingStrength : Prop

structure CoupledHeatMassTransferEvidence {T : TransportEquationPackage}
    {B : BoundaryConditionsPackage T} (C : CoupledHeatMassTransferPackage B) where
  soretEffectClosed : C.soretEffect
  dufourEffectClosed : C.dufourEffect
  crossDiffusionCoefficientsClosed : C.crossDiffusionCoefficients
  couplingStrengthClosed : C.couplingStrength

def CoupledHeatMassTransferClosed {T : TransportEquationPackage}
    {B : BoundaryConditionsPackage T} (C : CoupledHeatMassTransferPackage B) : Prop :=
  C.soretEffect ∧ C.dufourEffect ∧ C.crossDiffusionCoefficients ∧ C.couplingStrength

theorem coupled_heat_mass_transfer_closed_from_evidence {T : TransportEquationPackage}
    {B : BoundaryConditionsPackage T} (C : CoupledHeatMassTransferPackage B)
    (E : CoupledHeatMassTransferEvidence C) : CoupledHeatMassTransferClosed C := by
  exact And.intro E.soretEffectClosed
    (And.intro E.dufourEffectClosed
      (And.intro E.crossDiffusionCoefficientsClosed E.couplingStrengthClosed))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse

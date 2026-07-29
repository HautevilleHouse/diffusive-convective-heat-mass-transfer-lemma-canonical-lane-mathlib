import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure HeatMassEntropyPackage {P : DiffusiveConvectionPDEPackage} where
  entropyFunctional : Type u
  entropyProduction : Prop
  entropyFlux : Prop
  secondLawSatisfied : Prop

structure HeatMassEntropyEvidence {P : DiffusiveConvectionPDEPackage}
    (E : HeatMassEntropyPackage P) where
  entropyProductionClosed : E.entropyProduction
  entropyFluxClosed : E.entropyFlux
  secondLawSatisfiedClosed : E.secondLawSatisfied

def HeatMassEntropyClosed {P : DiffusiveConvectionPDEPackage}
    (E : HeatMassEntropyPackage P) : Prop :=
  E.entropyProduction ∧ E.entropyFlux ∧ E.secondLawSatisfied

theorem heat_mass_entropy_closed_from_evidence
    {P : DiffusiveConvectionPDEPackage} (Epkg : HeatMassEntropyPackage P)
    (E : HeatMassEntropyEvidence Epkg) : HeatMassEntropyClosed Epkg := by
  exact And.intro E.entropyProductionClosed
    (And.intro E.entropyFluxClosed E.secondLawSatisfiedClosed)

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
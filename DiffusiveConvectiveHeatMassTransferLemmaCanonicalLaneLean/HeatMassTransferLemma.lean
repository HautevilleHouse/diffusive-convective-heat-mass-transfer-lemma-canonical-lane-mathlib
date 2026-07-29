import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure HeatMassTransferLemmaPackage {C : ConvectionDiffusionPDEPackage} where
  lemmastatement : Prop
  energyEstimate : Prop
  maximumPrinciple : Prop
  stabilityEstimate : Prop
  asymptoticBehavior : Prop

structure HeatMassTransferLemmaEvidence {C : ConvectionDiffusionPDEPackage}
    (L : HeatMassTransferLemmaPackage C) where
  lemmastatementClosed : L.lemmastatement
  energyEstimateClosed : L.energyEstimate
  maximumPrincipleClosed : L.maximumPrinciple
  stabilityEstimateClosed : L.stabilityEstimate
  asymptoticBehaviorClosed : L.asymptoticBehavior

def HeatMassTransferLemmaClosed {C : ConvectionDiffusionPDEPackage}
    (L : HeatMassTransferLemmaPackage C) : Prop :=
  L.lemmastatement ∧ L.energyEstimate ∧ L.maximumPrinciple ∧ L.stabilityEstimate ∧ L.asymptoticBehavior

theorem heat_mass_transfer_lemma_closed_from_evidence
    {C : ConvectionDiffusionPDEPackage} (L : HeatMassTransferLemmaPackage C)
    (E : HeatMassTransferLemmaEvidence L) : HeatMassTransferLemmaClosed L := by
  exact And.intro E.lemmastatementClosed
    (And.intro E.energyEstimateClosed
      (And.intro E.maximumPrincipleClosed
        (And.intro E.stabilityEstimateClosed E.asymptoticBehaviorClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
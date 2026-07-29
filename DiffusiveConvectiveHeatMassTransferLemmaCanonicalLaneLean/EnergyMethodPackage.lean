import DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean.PartialDifferentialEquationPackage

/-!
# Energy Method Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure EnergyMethodPackage (P : PDEPackage) where
  energyFunctionalDefined : Prop
  energyDissipationRelation : Prop
  stabilityCondition : Prop
  energyDecayEstimate : Prop
  uniquenessFromEnergy : Prop

structure EnergyMethodEvidence (P : PDEPackage) (E : EnergyMethodPackage P) where
  energyFunctionalDefinedClosed : E.energyFunctionalDefined
  energyDissipationRelationClosed : E.energyDissipationRelation
  stabilityConditionClosed : E.stabilityCondition
  energyDecayEstimateClosed : E.energyDecayEstimate
  uniquenessFromEnergyClosed : E.uniquenessFromEnergy

def EnergyMethodClosed (P : PDEPackage) (E : EnergyMethodPackage P) : Prop :=
  E.energyFunctionalDefined ∧ E.energyDissipationRelation ∧
  E.stabilityCondition ∧ E.energyDecayEstimate ∧ E.uniquenessFromEnergy

theorem energy_method_closed_from_evidence (P : PDEPackage) (E : EnergyMethodPackage P)
    (Ev : EnergyMethodEvidence P E) : EnergyMethodClosed P E := by
  exact And.intro Ev.energyFunctionalDefinedClosed
    (And.intro Ev.energyDissipationRelationClosed
      (And.intro Ev.stabilityConditionClosed
        (And.intro Ev.energyDecayEstimateClosed Ev.uniquenessFromEnergyClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
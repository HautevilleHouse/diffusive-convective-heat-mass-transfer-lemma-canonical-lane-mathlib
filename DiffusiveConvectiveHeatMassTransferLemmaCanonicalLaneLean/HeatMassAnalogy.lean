import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure HeatMassAnalogyPackage where
  lewisNumber : Prop
  chiltonColburnAnalogy : Prop
  heatFluxCoupling : Prop
  massFluxCoupling : Prop
  analogyValid : Prop

structure HeatMassAnalogyEvidence (H : HeatMassAnalogyPackage) where
  lewisNumberClosed : H.lewisNumber
  chiltonColburnAnalogyClosed : H.chiltonColburnAnalogy
  heatFluxCouplingClosed : H.heatFluxCoupling
  massFluxCouplingClosed : H.massFluxCoupling
  analogyValidClosed : H.analogyValid

def HeatMassAnalogyClosed (H : HeatMassAnalogyPackage) : Prop :=
  H.lewisNumber ∧ H.chiltonColburnAnalogy ∧ H.heatFluxCoupling ∧
  H.massFluxCoupling ∧ H.analogyValid

theorem heat_mass_analogy_closed_from_evidence (H : HeatMassAnalogyPackage)
    (E : HeatMassAnalogyEvidence H) : HeatMassAnalogyClosed H := by
  exact And.intro E.lewisNumberClosed
    (And.intro E.chiltonColburnAnalogyClosed
      (And.intro E.heatFluxCouplingClosed
        (And.intro E.massFluxCouplingClosed E.analogyValidClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
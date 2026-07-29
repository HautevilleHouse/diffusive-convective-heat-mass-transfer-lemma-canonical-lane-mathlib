import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure DiffusiveConvectivePDEPackage where
  temperatureField : Type u
  concentrationField : Type v
  velocityField : Type w
  thermalDiffusivity : Prop
  massDiffusivity : Prop
  convectiveCouplingTerm : Prop
  pdeWellPosed : Prop

structure DiffusiveConvectivePDEEvidence (P : DiffusiveConvectivePDEPackage) where
  thermalDiffusivityClosed : P.thermalDiffusivity
  massDiffusivityClosed : P.massDiffusivity
  convectiveCouplingTermClosed : P.convectiveCouplingTerm
  pdeWellPosedClosed : P.pdeWellPosed

def DiffusiveConvectivePDEClosed (P : DiffusiveConvectivePDEPackage) : Prop :=
  P.thermalDiffusivity ∧ P.massDiffusivity ∧ P.convectiveCouplingTerm ∧ P.pdeWellPosed

theorem diffusive_convective_pde_closed_from_evidence (P : DiffusiveConvectivePDEPackage)
    (E : DiffusiveConvectivePDEEvidence P) : DiffusiveConvectivePDEClosed P := by
  exact And.intro E.thermalDiffusivityClosed
    (And.intro E.massDiffusivityClosed
      (And.intro E.convectiveCouplingTermClosed E.pdeWellPosedClosed))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
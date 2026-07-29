import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure DiffusiveConvectionPDEPackage where
  temperatureField : Type u
  concentrationField : Type v
  velocityField : Type w
  thermalDiffusivity : Prop
  massDiffusivity : Prop
  convectiveCoupling : Prop
  pdeSystemClosed : Prop

structure DiffusiveConvectionPDEEvidence (P : DiffusiveConvectionPDEPackage) where
  thermalDiffusivityClosed : P.thermalDiffusivity
  massDiffusivityClosed : P.massDiffusivity
  convectiveCouplingClosed : P.convectiveCoupling
  pdeSystemClosedTerm : P.pdeSystemClosed

def DiffusiveConvectionPDEClosed (P : DiffusiveConvectionPDEPackage) : Prop :=
  P.thermalDiffusivity ∧ P.massDiffusivity ∧ P.convectiveCoupling ∧ P.pdeSystemClosed

theorem diffusive_convection_pde_closed_from_evidence
    (P : DiffusiveConvectionPDEPackage) (E : DiffusiveConvectionPDEEvidence P) :
    DiffusiveConvectionPDEClosed P := by
  exact And.intro E.thermalDiffusivityClosed
    (And.intro E.massDiffusivityClosed
      (And.intro E.convectiveCouplingClosed E.pdeSystemClosedTerm))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure NusseltSherwoodPackage where
  nusseltNumber : Prop
  sherwoodNumber : Prop
  reynoldsNumber : Prop
  schmidtNumber : Prop
  prandtlNumber : Prop
  correlationValid : Prop

structure NusseltSherwoodEvidence (N : NusseltSherwoodPackage) where
  nusseltNumberClosed : N.nusseltNumber
  sherwoodNumberClosed : N.sherwoodNumber
  reynoldsNumberClosed : N.reynoldsNumber
  schmidtNumberClosed : N.schmidtNumber
  prandtlNumberClosed : N.prandtlNumber
  correlationValidClosed : N.correlationValid

def NusseltSherwoodClosed (N : NusseltSherwoodPackage) : Prop :=
  N.nusseltNumber ∧ N.sherwoodNumber ∧ N.reynoldsNumber ∧
  N.schmidtNumber ∧ N.prandtlNumber ∧ N.correlationValid

theorem nusselt_sherwood_closed_from_evidence (N : NusseltSherwoodPackage)
    (E : NusseltSherwoodEvidence N) : NusseltSherwoodClosed N := by
  exact And.intro E.nusseltNumberClosed
    (And.intro E.sherwoodNumberClosed
      (And.intro E.reynoldsNumberClosed
        (And.intro E.schmidtNumberClosed
          (And.intro E.prandtlNumberClosed E.correlationValidClosed))))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
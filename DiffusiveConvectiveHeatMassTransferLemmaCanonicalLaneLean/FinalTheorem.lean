import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

def ConstrainedDiffusiveConvectiveClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_diffusive_convective_endgame (A : AdmissibleClass) :
    ConstrainedDiffusiveConvectiveClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure SimilaritySolutionPackage {P : DiffusiveConvectionPDEPackage}
    {E : HeatMassEntropyPackage P} {B : BoundaryLayerPackage P E} where
  similarityVariable : Type u
  temperatureProfile : Prop
  concentrationProfile : Prop
  similarityReductionValid : Prop

structure SimilaritySolutionEvidence {P : DiffusiveConvectionPDEPackage}
    {E : HeatMassEntropyPackage P} {B : BoundaryLayerPackage P E}
    (S : SimilaritySolutionPackage P E B) where
  temperatureProfileClosed : S.temperatureProfile
  concentrationProfileClosed : S.concentrationProfile
  similarityReductionValidClosed : S.similarityReductionValid

def SimilaritySolutionClosed {P : DiffusiveConvectionPDEPackage}
    {E : HeatMassEntropyPackage P} {B : BoundaryLayerPackage P E}
    (S : SimilaritySolutionPackage P E B) : Prop :=
  S.temperatureProfile ∧ S.concentrationProfile ∧ S.similarityReductionValid

theorem similarity_solution_closed_from_evidence
    {P : DiffusiveConvectionPDEPackage} {E : HeatMassEntropyPackage P}
    {B : BoundaryLayerPackage P E} (S : SimilaritySolutionPackage P E B)
    (Ev : SimilaritySolutionEvidence S) : SimilaritySolutionClosed S := by
  exact And.intro Ev.temperatureProfileClosed
    (And.intro Ev.concentrationProfileClosed Ev.similarityReductionValidClosed)

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
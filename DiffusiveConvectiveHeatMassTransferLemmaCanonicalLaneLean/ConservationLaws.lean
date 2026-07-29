import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure ConservationLawsPackage where
  massConservation : Prop
  energyConservation : Prop
  speciesConservation : Prop
  closureRelations : Prop

structure ConservationLawsEvidence (C : ConservationLawsPackage) where
  massConservationClosed : C.massConservation
  energyConservationClosed : C.energyConservation
  speciesConservationClosed : C.speciesConservation
  closureRelationsClosed : C.closureRelations

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse

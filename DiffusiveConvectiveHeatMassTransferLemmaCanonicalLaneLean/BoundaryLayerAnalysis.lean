import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure BoundaryLayerPackage where
  thermalBoundaryLayerThickness : Prop
  concentrationBoundaryLayerThickness : Prop
  velocityBoundaryLayerThickness : Prop
  similaritySolutionExists : Prop
  dimensionlessNumbers : Prop

structure BoundaryLayerEvidence (B : BoundaryLayerPackage) where
  thermalBoundaryLayerThicknessClosed : B.thermalBoundaryLayerThickness
  concentrationBoundaryLayerThicknessClosed : B.concentrationBoundaryLayerThickness
  velocityBoundaryLayerThicknessClosed : B.velocityBoundaryLayerThickness
  similaritySolutionExistsClosed : B.similaritySolutionExists
  dimensionlessNumbersClosed : B.dimensionlessNumbers

def BoundaryLayerClosed (B : BoundaryLayerPackage) : Prop :=
  B.thermalBoundaryLayerThickness ∧ B.concentrationBoundaryLayerThickness ∧
  B.velocityBoundaryLayerThickness ∧ B.similaritySolutionExists ∧ B.dimensionlessNumbers

theorem boundary_layer_closed_from_evidence (B : BoundaryLayerPackage)
    (E : BoundaryLayerEvidence B) : BoundaryLayerClosed B := by
  exact And.intro E.thermalBoundaryLayerThicknessClosed
    (And.intro E.concentrationBoundaryLayerThicknessClosed
      (And.intro E.velocityBoundaryLayerThicknessClosed
        (And.intro E.similaritySolutionExistsClosed E.dimensionlessNumbersClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
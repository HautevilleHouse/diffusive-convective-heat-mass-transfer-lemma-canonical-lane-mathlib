import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure DimensionlessPackage where
  reynoldsNumber : ℝ
  prandtlNumber : ℝ
  schmidtNumber : ℝ
  pecletNumber : ℝ
  dimensionlessCorrelation : Prop

structure DimensionlessEvidence (D : DimensionlessPackage) where
  dimensionlessCorrelationClosed : D.dimensionlessCorrelation

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse

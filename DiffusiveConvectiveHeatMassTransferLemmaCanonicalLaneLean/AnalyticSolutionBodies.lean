import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure AnalyticSolutionPackage where
  exactSolutionExists : Prop
  similaritySolution : Prop
  separableSolution : Prop
  asymptoticBehavior : Prop

structure AnalyticSolutionEvidence (A : AnalyticSolutionPackage) where
  exactSolutionExistsClosed : A.exactSolutionExists
  similaritySolutionClosed : A.similaritySolution
  separableSolutionClosed : A.separableSolution
  asymptoticBehaviorClosed : A.asymptoticBehavior

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse

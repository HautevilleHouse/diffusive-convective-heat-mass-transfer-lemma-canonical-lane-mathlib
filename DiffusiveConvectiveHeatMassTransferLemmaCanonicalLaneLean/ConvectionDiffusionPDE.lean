import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure ConvectionDiffusionPDEPackage where
  temperatureField : Type u
  velocityField : Type v
  diffusivity : Type w
  convectionTerm : Type x
  sourceTerm : Type y
  pdeSatisfied : Prop
  boundaryConditions : Prop
  initialCondition : Prop
  solutionRegularity : Prop
  uniqueness : Prop

structure ConvectionDiffusionPDEEvidence (P : ConvectionDiffusionPDEPackage) where
  pdeSatisfiedClosed : P.pdeSatisfied
  boundaryConditionsClosed : P.boundaryConditions
  initialConditionClosed : P.initialCondition
  solutionRegularityClosed : P.solutionRegularity
  uniquenessClosed : P.uniqueness

def ConvectionDiffusionPDEClosed (P : ConvectionDiffusionPDEPackage) : Prop :=
  P.pdeSatisfied ∧ P.boundaryConditions ∧ P.initialCondition ∧ P.solutionRegularity ∧ P.uniqueness

theorem convection_diffusion_pde_closed_from_evidence
    (P : ConvectionDiffusionPDEPackage) (E : ConvectionDiffusionPDEEvidence P) :
    ConvectionDiffusionPDEClosed P := by
  exact And.intro E.pdeSatisfiedClosed
    (And.intro E.boundaryConditionsClosed
      (And.intro E.initialConditionClosed
        (And.intro E.solutionRegularityClosed E.uniquenessClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
import DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Partial Differential Equation Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure PDEComponent where
  diffusiveTerm : Prop
  convectiveTerm : Prop
  sourceTerm : Prop
  timeDerivative : Prop
  couplingOperator : Prop
  componentClosed : Prop

structure PDEPackage where
  diffusiveCoefficient : Prop
  convectiveVelocityField : Prop
  sourceTermFunction : Prop
  initialCondition : Prop
  boundaryCondition : Prop
  wellPosedness : Prop
  weakFormulation : Prop

structure PDEEvidence (P : PDEPackage) where
  diffusiveCoefficientClosed : P.diffusiveCoefficient
  convectiveVelocityFieldClosed : P.convectiveVelocityField
  sourceTermFunctionClosed : P.sourceTermFunction
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition
  wellPosednessClosed : P.wellPosedness
  weakFormulationClosed : P.weakFormulation

def PDEClosed (P : PDEPackage) : Prop :=
  P.diffusiveCoefficient ∧ P.convectiveVelocityField ∧
  P.sourceTermFunction ∧ P.initialCondition ∧
  P.boundaryCondition ∧ P.wellPosedness ∧ P.weakFormulation

theorem pde_closed_from_evidence (P : PDEPackage) (E : PDEEvidence P) :
    PDEClosed P := by
  exact And.intro E.diffusiveCoefficientClosed
    (And.intro E.convectiveVelocityFieldClosed
      (And.intro E.sourceTermFunctionClosed
        (And.intro E.initialConditionClosed
          (And.intro E.boundaryConditionClosed
            (And.intro E.wellPosednessClosed E.weakFormulationClosed)))))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse
/-!
# Boundary Conditions Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure BoundaryConditionsPackage {T : TransportEquationPackage} where
  dirichletCondition : Prop
  neumannCondition : Prop
  robinCondition : Prop
  interfaceCondition : Prop
  initialCondition : Prop

structure BoundaryConditionsEvidence {T : TransportEquationPackage}
    (B : BoundaryConditionsPackage T) where
  dirichletConditionClosed : B.dirichletCondition
  neumannConditionClosed : B.neumannCondition
  robinConditionClosed : B.robinCondition
  interfaceConditionClosed : B.interfaceCondition
  initialConditionClosed : B.initialCondition

def BoundaryConditionsClosed {T : TransportEquationPackage}
    (B : BoundaryConditionsPackage T) : Prop :=
  B.dirichletCondition ∧ B.neumannCondition ∧ B.robinCondition ∧ B.interfaceCondition ∧ B.initialCondition

theorem boundary_conditions_closed_from_evidence {T : TransportEquationPackage}
    (B : BoundaryConditionsPackage T) (E : BoundaryConditionsEvidence B) :
    BoundaryConditionsClosed B := by
  exact And.intro E.dirichletConditionClosed
    (And.intro E.neumannConditionClosed
      (And.intro E.robinConditionClosed
        (And.intro E.interfaceConditionClosed E.initialConditionClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse

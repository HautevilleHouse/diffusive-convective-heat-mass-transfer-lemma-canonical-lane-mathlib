/-!
# Transport Equation Package
-/

namespace HautevilleHouse
namespace DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean

structure TransportEquationPackage where
  temperatureField : Type
  concentrationField : Type
  velocityField : Type
  thermalDiffusivity : Prop
  massDiffusivity : Prop
  convectiveTerm : Prop
  sourceTerm : Prop
  equationFormulated : Prop

structure TransportEquationEvidence (P : TransportEquationPackage) where
  thermalDiffusivityClosed : P.thermalDiffusivity
  massDiffusivityClosed : P.massDiffusivity
  convectiveTermClosed : P.convectiveTerm
  sourceTermClosed : P.sourceTerm
  equationFormulatedClosed : P.equationFormulated

def TransportEquationClosed (P : TransportEquationPackage) : Prop :=
  P.thermalDiffusivity ∧ P.massDiffusivity ∧ P.convectiveTerm ∧ P.sourceTerm ∧ P.equationFormulated

theorem transport_equation_closed_from_evidence (P : TransportEquationPackage)
    (E : TransportEquationEvidence P) : TransportEquationClosed P := by
  exact And.intro E.thermalDiffusivityClosed
    (And.intro E.massDiffusivityClosed
      (And.intro E.convectiveTermClosed
        (And.intro E.sourceTermClosed E.equationFormulatedClosed)))

end DiffusiveConvectiveHeatMassTransferLemmaCanonicalLaneLean
end HautevilleHouse

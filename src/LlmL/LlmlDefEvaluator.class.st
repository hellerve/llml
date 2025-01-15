Class {
	#name : #LlmlDefEvaluator,
	#superclass : #LlmlExpressionEvaluator,
	#category : #'LlmL-Evaluator'
}

{ #category : #'as yet unclassified' }
LlmlDefEvaluator >> evaluate: anExpression in: anEvaluator [
	^ anEvaluator
		store: (anEvaluator evaluate: anExpression third)
		atSymbol: anExpression second name value
]

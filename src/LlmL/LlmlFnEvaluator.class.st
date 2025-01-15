Class {
	#name : #LlmlFnEvaluator,
	#superclass : #LlmlExpressionEvaluator,
	#category : #'LlmL-Evaluator'
}

{ #category : #'as yet unclassified' }
LlmlFnEvaluator >> evaluate: anExpression in: anEvaluator [
	^ LlmlFn new expression: anExpression
]

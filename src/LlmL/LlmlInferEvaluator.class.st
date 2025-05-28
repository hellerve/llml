Class {
	#name : #LlmlInferEvaluator,
	#superclass : #LlmlExpressionEvaluator,
	#category : #'LlmL-Evaluator'
}

{ #category : #'as yet unclassified' }
LlmlInferEvaluator >> evaluate: aCollection in: aLlmlEvaluator [
	^ LlmlInfer new connection: aLlmlEvaluator connection
]

Class {
	#name : #LlmlArithmeticEvaluator,
	#superclass : #LlmlExpressionEvaluator,
	#instVars : [
		'operation',
		'identity'
	],
	#category : #'LlmL-Evaluator'
}

{ #category : #'as yet unclassified' }
LlmlArithmeticEvaluator >> evaluate: anExpression in: anEvaluator [
	^ anExpression allButFirst
		inject: self identity
		into: [ :a :b | a perform: self operation withArguments: {anEvaluator evaluate: b} ]
]

{ #category : #accessing }
LlmlArithmeticEvaluator >> identity [
	^ identity
]

{ #category : #accessing }
LlmlArithmeticEvaluator >> identity: anObject [
	identity := anObject
]

{ #category : #accessing }
LlmlArithmeticEvaluator >> operation [
	^ operation
]

{ #category : #accessing }
LlmlArithmeticEvaluator >> operation: anObject [
	operation := anObject
]

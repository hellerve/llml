Class {
	#name : #LlmlFn,
	#superclass : #Object,
	#instVars : [
		'expression'
	],
	#category : #'LlmL-Model'
}

{ #category : #'as yet unclassified' }
LlmlFn >> evaluate: aCollection in: aLlmlEvaluator [
	| result evaluatedCollection |
	evaluatedCollection := aCollection allButFirst
			collect: [ :anExpression | aLlmlEvaluator evaluate: anExpression ].
	aLlmlEvaluator pushEnvironment: aCollection.
	expression second expressions
		withIndexDo: [ :aSymbol :anIndex | 
			aLlmlEvaluator
				store: (evaluatedCollection at: anIndex)
				atSymbol: aSymbol name value ].
	result := ((self expression allButFirst: 2)
			collect: [ :anExpression | aLlmlEvaluator evaluate: anExpression ]) last.
	aLlmlEvaluator popEnvironment.
	^ result
]

{ #category : #accessing }
LlmlFn >> expression [
	^ expression
]

{ #category : #accessing }
LlmlFn >> expression: anObject [
	expression := anObject
]

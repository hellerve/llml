Class {
	#name : #LlmlNumberNode,
	#superclass : #LlmlExpressionNode,
	#instVars : [
		'value'
	],
	#category : #'LlmL-Parser'
}

{ #category : #generated }
LlmlNumberNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitNumber: self
]

{ #category : #generated }
LlmlNumberNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
LlmlNumberNode >> value [
	^ value
]

{ #category : #generated }
LlmlNumberNode >> value: aSmaCCToken [
	value := aSmaCCToken
]

{ #category : #'as yet unclassified' }
LlmlNumberNode >> visit: aLlmlEvaluator [ 
	^ self value value asNumber
]

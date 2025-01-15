Class {
	#name : #LlmlSymbolNode,
	#superclass : #LlmlExpressionNode,
	#instVars : [
		'name'
	],
	#category : #'LlmL-Parser'
}

{ #category : #generated }
LlmlSymbolNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitSymbol: self
]

{ #category : #generated }
LlmlSymbolNode >> name [
	^ name
]

{ #category : #generated }
LlmlSymbolNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
LlmlSymbolNode >> tokenVariables [
	^ #(#name)
]

{ #category : #'as yet unclassified' }
LlmlSymbolNode >> visit: aLlmlEvaluator [
	^ aLlmlEvaluator symbolAt: self name value
]

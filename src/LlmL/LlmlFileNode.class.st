Class {
	#name : #LlmlFileNode,
	#superclass : #LlmlExpressionNode,
	#instVars : [
		'expressions'
	],
	#category : #'LlmL-Parser'
}

{ #category : #generated }
LlmlFileNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitFile: self
]

{ #category : #generated }
LlmlFileNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
LlmlFileNode >> expressions [
	^ expressions
]

{ #category : #generated }
LlmlFileNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #'generated-initialize-release' }
LlmlFileNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
]

{ #category : #'as yet unclassified' }
LlmlFileNode >> visit: aLlmlEvaluator [
	^ (self expressions
		collect: [ :anExpression | anExpression visit: aLlmlEvaluator ]) last
]

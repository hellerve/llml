Class {
	#name : #LlmlCallNode,
	#superclass : #LlmlExpressionNode,
	#instVars : [
		'leftParen',
		'expressions',
		'rightParen'
	],
	#category : #'LlmL-Parser'
}

{ #category : #generated }
LlmlCallNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitCall: self
]

{ #category : #generated }
LlmlCallNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
LlmlCallNode >> expressions [
	^ expressions
]

{ #category : #generated }
LlmlCallNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #'generated-initialize-release' }
LlmlCallNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
]

{ #category : #generated }
LlmlCallNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
LlmlCallNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
LlmlCallNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
LlmlCallNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
LlmlCallNode >> tokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #'as yet unclassified' }
LlmlCallNode >> visit: aLlmlEvaluator [
	| aResult |
	self expressions ifEmpty: [ ^ self ].

	aLlmlEvaluator callStack add: self.

	aResult := (aLlmlEvaluator symbolAt: self expressions first name value)
			evaluate: self expressions
			in: aLlmlEvaluator.

	aLlmlEvaluator callStack removeLast.

	^ aResult
]

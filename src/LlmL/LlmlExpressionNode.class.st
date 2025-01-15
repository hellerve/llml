Class {
	#name : #LlmlExpressionNode,
	#superclass : #SmaCCParseNode,
	#category : #'LlmL-Parser'
}

{ #category : #generated }
LlmlExpressionNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitExpression: self
]

{ #category : #'as yet unclassified' }
LlmlExpressionNode >> visit: anEvaluator [
	^ self subclassResponsibility
]

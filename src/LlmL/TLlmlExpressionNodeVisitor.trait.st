Trait {
	#name : #TLlmlExpressionNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'LlmL-Parser'
}

{ #category : #generated }
TLlmlExpressionNodeVisitor >> visitCall: aCall [
	^ self visitExpression: aCall
]

{ #category : #generated }
TLlmlExpressionNodeVisitor >> visitExpression: anExpression [
	^ self visitSmaCCParseNode: anExpression
]

{ #category : #generated }
TLlmlExpressionNodeVisitor >> visitFile: aFile [
	^ self visitExpression: aFile
]

{ #category : #generated }
TLlmlExpressionNodeVisitor >> visitNumber: aNumber [
	^ self visitExpression: aNumber
]

{ #category : #generated }
TLlmlExpressionNodeVisitor >> visitSymbol: aSymbol [
	^ self visitExpression: aSymbol
]

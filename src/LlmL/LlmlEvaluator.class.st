Class {
	#name : #LlmlEvaluator,
	#superclass : #Object,
	#instVars : [
		'symbols',
		'callStack',
		'model',
		'connection'
	],
	#category : #'LlmL-Evaluator'
}

{ #category : #accessing }
LlmlEvaluator >> callStack [
	^ callStack
]

{ #category : #accessing }
LlmlEvaluator >> callStack: anObject [
	callStack := anObject
]

{ #category : #accessing }
LlmlEvaluator >> connection [
	^ connection
]

{ #category : #accessing }
LlmlEvaluator >> connection: anObject [
	connection := anObject
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> defaultConnection [
	^ GtLlmConnectionRegistry instance defaultConnection
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> evaluate: anAst [
	^ anAst visit: self
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> hasSymbol: aSymbol [
	^ self symbols hasSymbol: aSymbol
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> initialize [
	super initialize.
	
	symbols := LlmlEnv new.
	callStack := OrderedCollection new.
	connection := self defaultConnection.
	
	self storePrimitives
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> popEnvironment [
	symbols := symbols parent
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> pushEnvironment [
	symbols := symbols child
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> pushEnvironment: aCall [
	symbols := symbols child.
	callStack add: aCall
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> store: aValue atSymbol: aSymbol [ 
	symbols at: aSymbol put: aValue
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> storePrimitives [
	symbols
		at: 'def' put: LlmlDefEvaluator new;
		at: 'fn' put: LlmlFnEvaluator new;
		at: '+' put: (LlmlArithmeticEvaluator new operation: #+; identity: 0);
		at: '-' put: (LlmlArithmeticEvaluator new operation: #-; identity: 0);
		at: '*' put: (LlmlArithmeticEvaluator new operation: #*; identity: 1);
		at: 'infer' put: LlmlInferEvaluator new
]

{ #category : #'as yet unclassified' }
LlmlEvaluator >> symbolAt: aSymbol [
	^ self symbols at: aSymbol
]

{ #category : #accessing }
LlmlEvaluator >> symbols [
	^ symbols
]

{ #category : #accessing }
LlmlEvaluator >> symbols: anObject [
	symbols := anObject
]

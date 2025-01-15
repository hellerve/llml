Class {
	#name : #LlmlEvaluator,
	#superclass : #Object,
	#instVars : [
		'symbols',
		'callStack',
		'model'
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

{ #category : #'as yet unclassified' }
LlmlEvaluator >> defaultModel [
	^ 'phi4'
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
	model := self defaultModel.
	
	self storePrimitives
]

{ #category : #accessing }
LlmlEvaluator >> model [
	^ model
]

{ #category : #accessing }
LlmlEvaluator >> model: anObject [
	model := anObject
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

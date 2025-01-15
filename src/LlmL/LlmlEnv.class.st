Class {
	#name : #LlmlEnv,
	#superclass : #Object,
	#instVars : [
		'local',
		'parent'
	],
	#category : #'LlmL-Evaluator'
}

{ #category : #'as yet unclassified' }
LlmlEnv >> at: aSymbol [
	(local includesKey: aSymbol) ifTrue: [ ^ local at: aSymbol ].

	parent ifNil: [ ^ self error: 'Symbol not found' ].

	^ parent at: aSymbol
]

{ #category : #'as yet unclassified' }
LlmlEnv >> at: aSymbol put: aValue [
	local at: aSymbol put: aValue
]

{ #category : #'as yet unclassified' }
LlmlEnv >> child [
	^ LlmlEnv new parent: self
]

{ #category : #'as yet unclassified' }
LlmlEnv >> hasSymbol: aSymbol [
	(local includesKey: aSymbol) ifTrue: [ ^ true ].

	parent ifNil: [ ^ false ].

	^ parent hasSymbol: aSymbol
]

{ #category : #'as yet unclassified' }
LlmlEnv >> initialize [
	super initialize.
	
	local := Dictionary new
]

{ #category : #accessing }
LlmlEnv >> parent [
	^ parent
]

{ #category : #accessing }
LlmlEnv >> parent: anObject [
	parent := anObject
]

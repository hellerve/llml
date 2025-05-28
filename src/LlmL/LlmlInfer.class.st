Class {
	#name : #LlmlInfer,
	#superclass : #Object,
	#instVars : [
		'connection'
	],
	#category : #'LlmL-Model'
}

{ #category : #accessing }
LlmlInfer >> connection [
	^ connection
]

{ #category : #accessing }
LlmlInfer >> connection: anObject [
	connection := anObject
]

{ #category : #'as yet unclassified' }
LlmlInfer >> evaluate: aCollection in: aLlmlEvaluator [
	| chat |
	chat := GtLlmChat new
			provider: (self connection buildProvider format: self format).
	chat
		sendMessage: 'Provide the output of the following expression: '
				, aLlmlEvaluator callStack last source.
	chat provider executions last wait.
	^ (chat messages last contentJson at: 'result') asNumber
]

{ #category : #'as yet unclassified' }
LlmlInfer >> format [
	^ {'type' -> 'object'.
		'properties' -> {'result' -> {'type' -> 'number'} asDictionary} asDictionary.
		'required' -> {'result'}.
		'additionalProperties' -> false} asDictionary
]

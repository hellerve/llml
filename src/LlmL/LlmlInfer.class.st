Class {
	#name : #LlmlInfer,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'LlmL-Model'
}

{ #category : #'as yet unclassified' }
LlmlInfer >> evaluate: aCollection in: aLlmlEvaluator [
	| chat |
	chat := GtOllamaChat new
			format: self format;
			model: self model;
			sendMessage: 'Provide the output of the following expression: '
					, aLlmlEvaluator callStack last source.
	^ (chat messages first contentJson at: 'result') asNumber
]

{ #category : #'as yet unclassified' }
LlmlInfer >> format [
	^ {'type' -> 'object'.
		'properties' -> {'result' -> {'type' -> 'number'} asDictionary} asDictionary.
		'required' -> {'result'}} asDictionary
]

{ #category : #accessing }
LlmlInfer >> model [
	^ model
]

{ #category : #accessing }
LlmlInfer >> model: anObject [
	model := anObject
]

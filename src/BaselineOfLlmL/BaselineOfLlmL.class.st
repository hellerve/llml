Class {
	#name : #BaselineOfLlmL,
	#superclass : #BaselineOf,
	#category : #BaselineOfLlmL
}

{ #category : #'as yet unclassified' }
BaselineOfLlmL >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Gt4Llm'
		]
]

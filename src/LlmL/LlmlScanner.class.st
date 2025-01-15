Class {
	#name : #LlmlScanner,
	#superclass : #SmaCCScanner,
	#category : #'LlmL-Parser'
}

{ #category : #generated }
LlmlScanner >> emptySymbolTokenId [
	^ 13
]

{ #category : #generated }
LlmlScanner >> errorTokenId [
	^ 14
]

{ #category : #generated }
LlmlScanner >> scan1 [
	[ self recordMatch: #(4).
	self step.
	currentCharacter == $: ifTrue: [ ^ self scan2 ].
	currentCharacter == $!
		or: [ (currentCharacter between: $# and: $')
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $9)
								or: [ (currentCharacter between: $< and: $?)
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_
														or: [ (currentCharacter between: $a and: $z) or: [ currentCharacter == $| ] ] ] ] ] ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scan2 [
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $# and: $')
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $9)
								or: [ (currentCharacter between: $< and: $?)
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_
														or: [ (currentCharacter between: $a and: $z) or: [ currentCharacter == $| ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scan3 [
	self recordMatch: #(4).
	self step.
	currentCharacter == $0 ifTrue: [ ^ self scan3X1 ].
	currentCharacter == $: ifTrue: [ ^ self scan2 ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(3 4).
			self step.
			currentCharacter == $: ifTrue: [ ^ self scan2 ].
			currentCharacter == $N ifTrue: [ ^ self scan4 ].
			currentCharacter isDigit ] whileTrue ].
	^ self scan3X2
]

{ #category : #generated }
LlmlScanner >> scan3X1 [
	self recordMatch: #(3 4).
	self step.
	currentCharacter == $: ifTrue: [ ^ self scan2 ].
	currentCharacter == $N ifTrue: [ ^ self scan4 ].
	currentCharacter == $x ifTrue: [ ^ self scan3X1X1 ].
	(currentCharacter between: $0 and: $7)
		ifTrue: [ [ self recordMatch: #(3 4).
			self step.
			currentCharacter == $: ifTrue: [ ^ self scan2 ].
			currentCharacter == $N ifTrue: [ ^ self scan4 ].
			currentCharacter between: $0 and: $7 ] whileTrue ].
	^ self scan3X1X2
]

{ #category : #generated }
LlmlScanner >> scan3X1X1 [
	self recordMatch: #(4).
	self step.
	currentCharacter == $: ifTrue: [ ^ self scan2 ].
	(currentCharacter isDigit or: [ currentCharacter between: $A and: $F ])
		ifTrue: [ [ self recordMatch: #(3 4).
			self step.
			currentCharacter == $: ifTrue: [ ^ self scan2 ].
			currentCharacter == $N ifTrue: [ ^ self scan4 ].
			currentCharacter isDigit or: [ currentCharacter between: $A and: $F ] ]
				whileTrue ].
	^ self scan3X1X1X1
]

{ #category : #generated }
LlmlScanner >> scan3X1X1X1 [
	(currentCharacter == $!
		or: [ (currentCharacter between: $# and: $')
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $?)
										or: [ (currentCharacter between: $G and: $Z)
												or: [ currentCharacter == $_
														or: [ (currentCharacter between: $a and: $z) or: [ currentCharacter == $| ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scan3X1X2 [
	(currentCharacter == $!
		or: [ (currentCharacter between: $# and: $')
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $9)
								or: [ (currentCharacter between: $< and: $?)
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_
														or: [ (currentCharacter between: $a and: $z) or: [ currentCharacter == $| ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scan3X2 [
	(currentCharacter == $!
		or: [ (currentCharacter between: $# and: $')
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $?)
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_
														or: [ (currentCharacter between: $a and: $z) or: [ currentCharacter == $| ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scan4 [
	self recordMatch: #(3 4).
	self step.
	currentCharacter == $: ifTrue: [ ^ self scan2 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $# and: $')
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $9)
								or: [ (currentCharacter between: $< and: $?)
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_
														or: [ (currentCharacter between: $a and: $z) or: [ currentCharacter == $| ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scanForToken [
	self step.
	currentCharacter == $( ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $) ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $0 ifTrue: [ ^ self scanForTokenX1 ].
	^ self scanForTokenX4
]

{ #category : #generated }
LlmlScanner >> scanForTokenX1 [
	self recordMatch: #(3).
	self step.
	currentCharacter == $N ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $x
		ifTrue: [ self step.
			(currentCharacter isDigit or: [ currentCharacter between: $A and: $F ])
				ifTrue: [ [ self recordMatch: #(3).
					self step.
					currentCharacter == $N ifTrue: [ ^ self recordAndReportMatch: #(3) ].
					currentCharacter isDigit or: [ currentCharacter between: $A and: $F ] ]
						whileTrue ].
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $7)
		ifTrue: [ [ self recordMatch: #(3).
			self step.
			currentCharacter == $N ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter between: $0 and: $7 ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scanForTokenX2 [
	[ self recordMatch: #(3).
	self step.
	currentCharacter == $N ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scanForTokenX3 [
	[ self recordMatch: #(5).
	self step.
	currentCharacter isSeparator or: [ currentCharacter == Character pageUp ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> scanForTokenX4 [
	currentCharacter isDigit ifTrue: [ ^ self scanForTokenX2 ].
	('+-' includes: currentCharacter) ifTrue: [ ^ self scan3 ].
	(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
		ifTrue: [ ^ self scanForTokenX3 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $$ and: $&)
				or: [ currentCharacter == $*
						or: [ (currentCharacter between: $. and: $/)
								or: [ (currentCharacter between: $< and: $?)
										or: [ (currentCharacter between: $A and: $Z)
												or: [ currentCharacter == $_
														or: [ (currentCharacter between: $a and: $z) or: [ currentCharacter == $| ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
LlmlScanner >> tokenActions [
	^ #(nil nil nil nil #whitespace)
]

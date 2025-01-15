Class {
	#name : #LlmlParser,
	#superclass : #SmaCCParser,
	#category : #'LlmL-Parser'
}

{ #category : #'generated-accessing' }
LlmlParser class >> cacheId [
	^'2025-01-14T22:04:33.202743+01:00'
]

{ #category : #generated }
LlmlParser class >> definitionComment [
"%root Expression;
%prefix Llml;
%suffix Node;

<sign>
	: \+|\-
	;
<number>
	: <sign>? (([1-9] \d*) | (0[0-7]+) | (0x[0-9A-F]+) | 0) N?	# 36rNUMBER
	;
<firstSymbolChar>
	: [a-zA-Z!$%&*\-_+=<>\.?/\|]
	;
<symbolChars>
	: <firstSymbolChar> | \d | \# | \'
	;
<symbol>
	: (<firstSymbolChar> (<symbolChars> | \: <symbolChars>)* \/)? <firstSymbolChar> (<symbolChars> | \: <symbolChars>)*
	;
<whitespace>
	: \s+
	;

File
	: Expressions {{}}
	;
Expressions
	:
	| Expressions Expression 'expression'
	;
Expression 
	: Number
	| Symbol
	| Call
	;
Call
	: ""("" 'leftParen' Expressions "")"" 'rightParen' {{}}
	;
Symbol
	: <symbol> 'name' {{}}
	;
Number
	: <number> 'value' {{}}
	;"
]

{ #category : #generated }
LlmlParser class >> reduceTable [
^#(
	#(8 0 #reduceActionForExpressions1: 446465 false) 
	#(7 1 #reduceActionForFile1: 417793 false) 
	#(12 1 #reduceActionForNumber1: 646145 false) 
	#(11 1 #reduceActionForSymbol1: 611329 false) 
	#(8 2 #reduceActionForExpressions2: 446466 false) 
	#(9 1 #liftFirstValue: 504835 false) 
	#(9 1 #liftFirstValue: 504834 false) 
	#(9 1 #liftFirstValue: 504833 false) 
	#(10 3 #reduceActionForCall1: 548865 false)
	).
]

{ #category : #generated }
LlmlParser class >> scannerClass [
	^LlmlScanner
]

{ #category : #generated }
LlmlParser class >> startingStateForFile [
	^ 1
]

{ #category : #generated }
LlmlParser class >> symbolNames [
	^ #('"("' '")"' '<number>' '<symbol>' '<whitespace>' 'B e g i n' 'File' 'Expressions' 'Expression' 'Call' 'Symbol' 'Number' 'E O F' 'error')
]

{ #category : #generated }
LlmlParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #LlmlFileNode #LlmlFileNode #OrderedCollection #LlmlExpressionNode #LlmlCallNode #LlmlSymbolNode #LlmlNumberNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
LlmlParser class >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 3 0 6 0 4 0 9 0 7 0 13 0 8 0 6 0 13] 
#[0 0 0 0 13] 
#[1 0 17 0 1 0 21 0 3 0 25 0 4 0 29 0 9 0 29 0 10 0 29 0 11 0 29 0 12 0 10 0 13] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 45 0 8] 
#[0 0 14 0 1 0 2 0 3 0 4 0 13] 
#[0 0 18 0 1 0 2 0 3 0 4 0 13] 
#[0 0 22 0 1 0 2 0 3 0 4 0 13] 
#[0 0 26 0 1 0 2 0 3 0 4 0 13] 
#[0 0 30 0 1 0 2 0 3 0 4 0 13] 
#[0 0 34 0 1 0 2 0 3 0 4 0 13] 
#[1 0 17 0 1 0 49 0 2 0 21 0 3 0 25 0 4 0 29 0 9 0 29 0 10 0 29 0 11 0 29 0 12] 
#[0 0 38 0 1 0 2 0 3 0 4 0 13]
	).
]

{ #category : #'generated-reduction actions' }
LlmlParser >> reduceActionForCall1: nodes [
	| result |
	result := LlmlCallNode new.
	result leftParen: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result expressions.
	result rightParen: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
LlmlParser >> reduceActionForExpressions1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
LlmlParser >> reduceActionForExpressions2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
LlmlParser >> reduceActionForFile1: nodes [
	| result |
	result := LlmlFileNode new.
	result addNodes: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
LlmlParser >> reduceActionForNumber1: nodes [
	| result |
	result := LlmlNumberNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
LlmlParser >> reduceActionForSymbol1: nodes [
	| result |
	result := LlmlSymbolNode new.
	result name: (nodes at: 1).
	^ result
]

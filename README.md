# llml

A silly language that lets LLMs do the heavy lifting.

You can write code yourself:

```st
LlmlEvaluator new evaluate:
	(LlmlParser parse: 
		'(def x (fn (n) (* n 2)))
		 (+ (x 10) 3)') "=> 23"
```

Or instead let an LLM do the heavy lifting:

```st
LlmlEvaluator new evaluate:
	(LlmlParser parse: 
		'(def factorial (infer))
		 (factorial 6)') "=> 720"
```

The inference uses your default LLM connection as configured inside Glamorous Toolkit. You can also select one by hand:

```
LlmlEvaluator new
	connection: (GtLlmConnection new
			provider: GtOllamaProvider;
			model: 'llama3.2');
	evaluate: (LlmlParser
			parse: '(def factorial (infer))
		 (factorial 4)')
```

## Installation

```st
Metacello new
	repository: 'github://hellerve/llml:main/src';
	baseline: 'LlmL';
	load
```

<hr/>

Have fun!

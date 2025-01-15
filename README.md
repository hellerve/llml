# llml

A sillsy language that lets LLMs do the heavy lifting.

You can write code yourself:

```
LlmlEvaluator new evaluate:
	(LlmlParser parse: 
		'(def x (fn (n) (* n 2)))
		 (+ (x 10) 3)') "=> 23"
```

Or instead let an LLM do the heavy lifting:

```
LlmlEvaluator new evaluate:
	(LlmlParser parse: 
		'(def factorial (infer))
		 (factorial 6)') "=> 720"
```

The latter will use Ollama with the Phi4 model. It’s hardcoded, and I didn’t bother making it customizable, because
this is a funny but terrible idea.
## Installation

```st
Metacello new
	repository: 'github://hellerve/llml:main/src';
	baseline: 'LlmL';
	load
```

<hr/>

Have fun!

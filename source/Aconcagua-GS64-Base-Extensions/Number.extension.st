Extension { #name : 'Number' }

{ #category : '*Aconcagua-GS64-Base-Extensions' }
Number >> _basicRetry: aSelector coercing: aNumber [

"A difference in representation between the receiver and aNumber has prevented
 aSelector from being executed.  Coerce either the receiver or aNumber to the
 higher of their generalities and attempt to execute the method represented by
 aSelector again.

 This is the basis of the type coercion logic for all Numbers."
| gen argGen |
" numeric primitives #=, #~= check for   (anArg isKindOf: Number)
  and if that result is  false ,   the compare result is returned
  directly by those primitives
"
gen := self _generality .
argGen := aNumber _generality .
(gen < argGen ) ifTrue: [
  ^ (aNumber _coerce: self) perform: aSelector with: aNumber
].
(gen > argGen ) ifTrue: [
  ^self perform: aSelector with: (self _coerce: aNumber)
].
self _uncontinuableError.  "coercion failed"

]

{ #category : '*Aconcagua-GS64-Base-Extensions' }
Number >> _retry: aSelector coercing: aNumber [

	^ (aNumber isKindOf: UnitBehavior)
		  ifTrue: [ aNumber _basicRetry: aSelector coercing: self ]
		  ifFalse: [ self _basicRetry: aSelector coercing: aNumber ]
]

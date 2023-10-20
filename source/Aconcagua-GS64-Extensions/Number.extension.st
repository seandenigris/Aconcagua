Extension { #name : 'Number' }

{ #category : '*Aconcagua-GS64-Extensions' }
Number >> _retry: aSelector coercing: aNumber [

	^ (aNumber isKindOf: UnitBehavior)
		  ifTrue: [ aNumber _basicRetry: aSelector coercing: self ]
		  ifFalse: [ self _basicRetry: aSelector coercing: aNumber ]
]

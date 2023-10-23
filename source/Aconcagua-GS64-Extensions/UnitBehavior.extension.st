Extension { #name : 'UnitBehavior' }

{ #category : '*Aconcagua-GS64-Extensions' }
UnitBehavior >> _basicRetry: aSelector coercing: aNumber [

	^ aSelector = #/
		  ifTrue: [ self reciprocal perform: #* with: aNumber ]
		  ifFalse: [ self perform: aSelector with: aNumber ]
]

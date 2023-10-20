Extension { #name : 'UnitBehavior' }

{ #category : '*Aconcagua-GS64-Extensions' }
UnitBehavior >> _basicRetry: aSelector coercing: aNumber [

	^ (#( #* #/ ) includes: aSelector)
		  ifTrue: [ self perform: aSelector with: aNumber ]
		  ifFalse: [ aNumber _retry: aSelector coercing: self ]
]

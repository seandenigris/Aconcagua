Extension { #name : 'UnitBehavior' }

{ #category : '*Aconcagua-GS64-Extensions' }
UnitBehavior >> _coerce: aNumber [

	^ self with: aNumber
]

{ #category : '*Aconcagua-GS64-Extensions' }
UnitBehavior >> _generality [

	^ ArithmeticObject infinity
]

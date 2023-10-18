Extension { #name : 'MeasureBagFraction' }

{ #category : '*Aconcagua-GS64-Extensions' }
MeasureBagFraction class >> numerator: n denominator: d [
	"Avoid reducing the fraction for MeasureBag"

	(self _newSmallFraction: n denom: d reduce: false) ifNotNil: [ :res |
		^ res ]
]

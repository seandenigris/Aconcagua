Extension { #name : 'MeasureBagFraction' }

{ #category : '*Aconcagua-GS64-Extensions' }
MeasureBagFraction class >> numerator: n denominator: d [
	"Avoid reducing the fraction for MeasureBag"

	^self basicNew setNumerator: n denominator: d
]

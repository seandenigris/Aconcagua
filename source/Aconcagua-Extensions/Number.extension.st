Extension { #name : 'Number' }

{ #category : '*Aconcagua-Extensions' }
Number >> addInfinity: anInfinity [

	^anInfinity
]

{ #category : '*Aconcagua-Extensions' }
Number >> addMeasure: aMeasure [

	^MeasureBag with: aMeasure with: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> addMeasureBag: aMeasureBag [

	^aMeasureBag addMeasure: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> addMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : '*Aconcagua-Extensions' }
Number >> addSameDomainMeasure: aMeasure [

	^ self + aMeasure amount
]

{ #category : '*Aconcagua-Extensions' }
Number >> amount [

	^self
]

{ #category : '*Aconcagua-Extensions' }
Number >> baseUnit [

	^NullUnit new
]

{ #category : '*Aconcagua-Extensions' }
Number >> compareGreaterThan: aNumber [

	^aNumber < self
]

{ #category : '*Aconcagua-Extensions' }
Number >> convertAmountToBaseUnit [

	^self
]

{ #category : '*Aconcagua-Extensions' }
Number >> convertTo: aTargetUnit [ 
	"A number only can be converted in a number... therefore, if the unit to which it is wanted to convert
	is the same to the one of the numbers returns self, else returns an error."
	
	^aTargetUnit = self baseUnit
		ifTrue: [ self ]
		ifFalse: [ 
			CanNotConvertMeasureException
				signalSourceMeasure: self 
				targetUnit: aTargetUnit ]
]

{ #category : '*Aconcagua-Extensions' }
Number >> convertToBaseUnit [

	^self
]

{ #category : '*Aconcagua-Extensions' }
Number >> createBagWith: aMeasure [

	^aMeasure createBagWithNumber: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> createBagWithMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure]
		ifFalse: [aMeasure createBagWithNumber: self]
]

{ #category : '*Aconcagua-Extensions' }
Number >> createBagWithNumber: aNumber [

	Error signal: (
		'A MeasureBag should not be creates only with numbers: <1p> <2p>'
			expandMacrosWith: self
			with: aNumber)
]

{ #category : '*Aconcagua-Extensions' }
Number >> denominator [

	^1
]

{ #category : '*Aconcagua-Extensions' }
Number >> divideByUnit: aUnit [

	^aUnit with: 1 / self
]

{ #category : '*Aconcagua-Extensions' }
Number >> divideInfinity: anInfinity [

	^0
]

{ #category : '*Aconcagua-Extensions' }
Number >> divideMeasure: aMeasure [

	^Measure amount: aMeasure amount / self unit: aMeasure unit
]

{ #category : '*Aconcagua-Extensions' }
Number >> divideMeasureBag: aMeasureBag [

	^aMeasureBag divideByMeasure: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> divideMinusInfinity: aMinusInfinity [

	^0
]

{ #category : '*Aconcagua-Extensions' }
Number >> equalsMeasure: aMeasure [

	^ ( self isNothing and: [ aMeasure isNothing ] ) or: [
		  ( self unit sameDomainAs: aMeasure unit ) and: [ self = aMeasure amount ] ]
]

{ #category : '*Aconcagua-Extensions' }
Number >> equalsMeasureBag: aMeasureBag [

	^aMeasureBag equalsMeasure: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> fromInfinity [

	^ArithmeticObjectInterval
		from: ArithmeticObject infinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : '*Aconcagua-Extensions' }
Number >> fromMinusInfinity [

	^ArithmeticObjectInterval
		from: ArithmeticObject minusInfinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : '*Aconcagua-Extensions' }
Number >> greaterThanMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure < aMeasure unit nullMeasure]
		ifFalse: [(aMeasure convertTo: self baseUnit) amount < self]
]

{ #category : '*Aconcagua-Extensions' }
Number >> isFixed [

	^true
]

{ #category : '*Aconcagua-Extensions' }
Number >> isMeasureBag [

	^false
]

{ #category : '*Aconcagua-Extensions' }
Number >> isNothing [

	^self = 0
]

{ #category : '*Aconcagua-Extensions' }
Number >> lessThanMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure > aMeasure unit nullMeasure]
		ifFalse: [(aMeasure convertTo: self baseUnit) amount > self]
]

{ #category : '*Aconcagua-Extensions' }
Number >> moduloInfinity: anInfinity [

	^0
]

{ #category : '*Aconcagua-Extensions' }
Number >> moduloMeasure: aMeasure [

	^Measure amount: aMeasure amount // self unit: aMeasure unit
]

{ #category : '*Aconcagua-Extensions' }
Number >> moduloMeasureBag: aMeasureBag [

	^aMeasureBag moduloByMeasure: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> moduloMinusInfinity: aMInusInfinity [

	^0
]

{ #category : '*Aconcagua-Extensions' }
Number >> multiplyByUnit: aUnit [

	^aUnit with: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> multiplyInfinity: anInfinity [

	^self > 0 ifTrue: [anInfinity] ifFalse: [anInfinity negated]
]

{ #category : '*Aconcagua-Extensions' }
Number >> multiplyMeasure: aMeasure [

	^Measure amount: aMeasure amount * self unit: aMeasure unit
]

{ #category : '*Aconcagua-Extensions' }
Number >> multiplyMeasureBag: aMeasureBag [

	^aMeasureBag multiplyMeasure: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> multiplyMinusInfinity: aMinusInfinity [

	^self > 0 ifTrue: [aMinusInfinity] ifFalse: [aMinusInfinity negated]
]

{ #category : '*Aconcagua-Extensions' }
Number >> numerator [

	^self
]

{ #category : '*Aconcagua-Extensions' }
Number >> quoFrom: aNumber [

	^ aNumber quo: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> remFrom: aNumber [

	^ aNumber rem: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> remainderInfinity: anInfinity [

	^0
]

{ #category : '*Aconcagua-Extensions' }
Number >> remainderMeasure: aMeasure [

	^Measure amount: aMeasure amount \\ self unit: aMeasure unit
]

{ #category : '*Aconcagua-Extensions' }
Number >> remainderMeasureBag: aMeasureBag [

	^aMeasureBag remainderByMeasure: self
]

{ #category : '*Aconcagua-Extensions' }
Number >> remainderMinusInfinity: aMinusInfinity [

	^0
]

{ #category : '*Aconcagua-Extensions' }
Number >> sameDomainAs: aMeasure [

	^self unit sameDomainAs: aMeasure unit
]

{ #category : '*Aconcagua-Extensions' }
Number >> subtractFrom: aNumber [

	^aNumber - self
]

{ #category : '*Aconcagua-Extensions' }
Number >> subtractInfinity: anInfinity [

	^anInfinity
]

{ #category : '*Aconcagua-Extensions' }
Number >> subtractMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : '*Aconcagua-Extensions' }
Number >> toInfinity [

	^ArithmeticObjectInterval
		from: self
		to: ArithmeticObject infinity
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : '*Aconcagua-Extensions' }
Number >> toMinusInfinity [

	^ArithmeticObjectInterval
		from: self
		to: ArithmeticObject minusInfinity
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : '*Aconcagua-Extensions' }
Number >> unit [

	^self baseUnit
]

{ #category : '*Aconcagua-Extensions' }
Number >> unitNameOf: aUnit [

	^self abs = 1 ifTrue: [aUnit nameForOne] ifFalse: [aUnit nameForMany]
]

Class {
	#name : 'MinusInfinityClassTest',
	#superclass : 'TestCase',
	#instVars : [
		'meter',
		'second',
		'minusInfinity',
		'infinity'
	],
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'initialization' }
MinusInfinityClassTest >> setUp [

	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	infinity := 	InfinityClass new.
	minusInfinity := 	MinusInfinityClass new
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testAdd [

	self assert: minusInfinity + minusInfinity equals: minusInfinity.
	self assert: 9 + minusInfinity equals: minusInfinity.
	self assert: minusInfinity + 9 equals: minusInfinity.
	self
		should: [ minusInfinity + infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Sum operation is indeterminate between Minus Infinity and Infinity' ].
	self
		should: [ infinity + minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Sum operation is indeterminate between Infinity and Minus Infinity' ]
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testAmount [

	self assert: minusInfinity equals: minusInfinity
]

{ #category : 'test bag creation' }
MinusInfinityClassTest >> testBagCreationWithMeasure [

	| bag |

	bag := (10 * meter) + (minusInfinity * second).

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10 * meter).
	self assert: (bag measures includes: minusInfinity * second)
]

{ #category : 'test bag creation' }
MinusInfinityClassTest >> testBagCreationWithNumber [

	| bag otherBag |

	bag := 10 + (minusInfinity * second).
	otherBag := (minusInfinity * meter) + 10.

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10).
	self assert: (bag measures includes: minusInfinity * second).

	self assert: otherBag isMeasureBag.
	self assert: (otherBag measures includes: minusInfinity * meter).
	self assert: (otherBag measures includes: 10)
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testBaseUnit [

	self assert: minusInfinity baseUnit equals: NullUnit new
]

{ #category : 'test magnitude protocol' }
MinusInfinityClassTest >> testBetweenAnd [


	self assert: (minusInfinity between: minusInfinity and: 1).
	self assert: (minusInfinity between: minusInfinity and: minusInfinity).
	self deny: (minusInfinity between: 1 and: 10)
]

{ #category : 'test converting' }
MinusInfinityClassTest >> testConvertAmountToBaseUnit [

	self assert: minusInfinity convertAmountToBaseUnit equals: 0
]

{ #category : 'test converting' }
MinusInfinityClassTest >> testConvertTo [

	| unit |
	unit := BaseUnit named: 'peso'.
	self
		should: [ minusInfinity convertTo: unit ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'It is not possible to convert Minus Infinity to peso' ]
]

{ #category : 'test converting' }
MinusInfinityClassTest >> testConvertToBaseUnit [

	self assert: minusInfinity convertToBaseUnit equals: minusInfinity
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testDenominator [

	self assert: minusInfinity denominator equals: 1
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testDivide [

	self
		should: [ minusInfinity / minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Minus Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity / infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Minus Infinity and Infinity' ].
	self
		should: [ infinity / minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Infinity and Minus Infinity' ].
	self assert: 9 / minusInfinity equals: 0.
	self
		should: [ minusInfinity / 9 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Minus Infinity and 9' ]
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testDivideByUnit [

	self assert: (minusInfinity divideByUnit: meter) equals: 0 * meter
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testDivideMeasure [

	self assert: (minusInfinity divideMeasure: meter * 5) equals: 0
]

{ #category : 'test comparing' }
MinusInfinityClassTest >> testEqualsMeasure [

	| measure |

	measure := (BaseUnit named: 'peso') with: 5.
	self assert: (minusInfinity equalsMeasure: minusInfinity).
	self deny: (minusInfinity equalsMeasure: measure)
]

{ #category : 'test comparing' }
MinusInfinityClassTest >> testEqualsMeasureBag [

	| measureBag |

	measureBag := ((BaseUnit named: 'peso') with: 5) + ((BaseUnit named: 'dollar') with: 5).
	self assert: (minusInfinity equalsMeasureBag: minusInfinity).
	self deny: (minusInfinity equalsMeasureBag: measureBag)
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testIsMeasureBag [

	self deny: minusInfinity isMeasureBag
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testIsNothing [

	self deny: minusInfinity isNothing
]

{ #category : 'test magnitude protocol' }
MinusInfinityClassTest >> testMax [

	self assert: (minusInfinity max: 5) equals: 5.
	self assert: (5 max: minusInfinity) equals: 5.
	self assert: (infinity max: minusInfinity) equals: infinity.
	self assert: (minusInfinity max: infinity) equals: infinity.
	self assert: (minusInfinity max: minusInfinity) equals: minusInfinity
]

{ #category : 'test magnitude protocol' }
MinusInfinityClassTest >> testMin [

	self assert: (minusInfinity min: 5) equals: minusInfinity.
	self assert: (5 min: minusInfinity) equals: minusInfinity.
	self assert: (infinity min: minusInfinity) equals: minusInfinity.
	self assert: (minusInfinity min: infinity) equals: minusInfinity.
	self assert: (minusInfinity min: minusInfinity) equals: minusInfinity
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testModulo [

	self
		should: [ minusInfinity // minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Minus Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity // infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Minus Infinity and Infinity' ].
	self
		should: [ infinity // minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Infinity and Minus Infinity' ].
	self assert: 9 // minusInfinity equals: 0.
	self
		should: [ minusInfinity // 9 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Minus Infinity and 9' ]
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testModuloMeasure [

	self assert: (minusInfinity moduloMeasure: 5 * meter) equals: 0
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplication [

	self assert: minusInfinity * minusInfinity equals: infinity.
	self assert: 9 * minusInfinity equals: minusInfinity.
	self assert: -9 * minusInfinity equals: infinity.
	self assert: minusInfinity * 9 equals: minusInfinity.
	self assert: minusInfinity * -9 equals: infinity.
	self assert: minusInfinity * infinity equals: minusInfinity.
	self assert: infinity * minusInfinity equals: minusInfinity.

	self
		should: [ 0 * minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Minus Infinity' ].

	self
		should: [ minusInfinity * 0 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Minus Infinity' ]
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplyByUnit [

	self
		assert: (minusInfinity multiplyByUnit: meter)
		equals: minusInfinity * meter
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplyMeasure [

	self
		assert: (minusInfinity multiplyMeasure: 5 * meter)
		equals: minusInfinity
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testNegated [

	self assert: minusInfinity negated equals: infinity
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testNegative [

	self deny: minusInfinity negative
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testNumerator [

	self assert: minusInfinity numerator equals: minusInfinity
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testPositive [

	self assert: minusInfinity positive
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testRemainder [

	self
		should: [ minusInfinity \\ minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Minus Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity \\ infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Minus Infinity and Infinity' ].
	self
		should: [ infinity \\ minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity \\ 9 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Minus Infinity and 9' ].
	self
		should: [ 9 \\ minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Minus Infinity' ]
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testRemainderMeasure [

	self
		should: [ minusInfinity remainderMeasure: 5 * meter ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Minus Infinity' ]
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testRoundTo [

	self assert: (minusInfinity roundTo: 2) equals: minusInfinity
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testSameDomainAs [

	self assert: (minusInfinity sameDomainAs: 1).
	self deny: (minusInfinity sameDomainAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testSameUnitAs [

	self assert: (minusInfinity sameUnitAs: 1).
	self deny: (minusInfinity sameUnitAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testSubtract [

	self
		should: [ minusInfinity - minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Subtract operation is indeterminate between Minus Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity - infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Subtract operation is indeterminate between Minus Infinity and Infinity' ].
	self
		should: [ infinity - minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Subtract operation is indeterminate between Infinity and Minus Infinity' ].
	self assert: 9 - minusInfinity equals: infinity.
	self assert: minusInfinity - 9 equals: minusInfinity
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToBy [

	| interval |
	interval := minusInfinity to: minusInfinity by: 5.
	self
		assert: interval from equals: minusInfinity;
		assert: interval to equals: minusInfinity;
		assert: interval size equals: infinity;
		assert: interval by equals: 5
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToFromFixed [

	| interval |
	interval := 5 toMinusInfinity.
	self
		assert: interval from equals: 5;
		assert: interval to equals: minusInfinity;
		assert: interval size equals: infinity;
		assert: interval by equals: 1
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToInfinity [

	| interval |
	interval := minusInfinity to: minusInfinity.
	self
		assert: interval from equals: minusInfinity;
		assert: interval to equals: minusInfinity;
		assert: interval size equals: infinity;
		assert: interval by equals: 1
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToToFixed [

	| interval |
	interval := minusInfinity to: 5.
	self
		assert: interval from equals: minusInfinity;
		assert: interval to equals: 5;
		assert: interval size equals: infinity;
		assert: interval by equals: 1
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testTruncated [

	self assert: minusInfinity truncated equals: minusInfinity
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testUnit [

	self assert: minusInfinity unit equals: NullUnit new
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testUnitNameOf [

	| unit |
	unit := BaseUnit named: 'meter'.
	self assert: (minusInfinity unitNameOf: unit) equals: 'meters'
]

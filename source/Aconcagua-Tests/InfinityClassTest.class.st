Class {
	#name : 'InfinityClassTest',
	#superclass : 'TestCase',
	#instVars : [
		'meter',
		'second',
		'infinity',
		'minusInfinity'
	],
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'initialization' }
InfinityClassTest >> setUp [

	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	infinity := 	InfinityClass new.
	minusInfinity := 	MinusInfinityClass new
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testAdd [

	self assert: infinity + infinity equals: infinity.
	self assert: 9 + infinity equals: infinity.
	self assert: infinity + 9 equals: infinity.
	self
		should: [ infinity + minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Sum operation is indeterminate between Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity + infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Sum operation is indeterminate between Minus Infinity and Infinity' ]
]

{ #category : 'test accessing' }
InfinityClassTest >> testAmount [

	self assert: infinity equals: infinity
]

{ #category : 'test bag creation' }
InfinityClassTest >> testBagCreationWithMeasure [

	| bag |

	bag := (10 * meter) + (infinity * second).

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10 * meter).
	self assert: (bag measures includes: infinity * second)
]

{ #category : 'test bag creation' }
InfinityClassTest >> testBagCreationWithNumber [

	| bag otherBag |

	bag := 10 + (infinity * second).
	otherBag := (infinity * meter) + 10.

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10).
	self assert: (bag measures includes: infinity * second).

	self assert: otherBag isMeasureBag.
	self assert: (otherBag measures includes: infinity * meter).
	self assert: (otherBag measures includes: 10)
]

{ #category : 'test accessing' }
InfinityClassTest >> testBaseUnit [

	self assert: infinity baseUnit equals: NullUnit new
]

{ #category : 'test magnitude protocol' }
InfinityClassTest >> testBetweenAnd [

	self assert: (infinity between: 1 and: infinity).
	self deny: (infinity between: 1 and: 10)
]

{ #category : 'test converting' }
InfinityClassTest >> testConvertAmountToBaseUnit [

	self assert: infinity convertAmountToBaseUnit equals: 0
]

{ #category : 'test converting' }
InfinityClassTest >> testConvertTo [

	| unit |
	unit := BaseUnit named: 'peso'.
	self
		should: [ infinity convertTo: unit ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals: 'It is not possible to convert Infinity to peso' ]
]

{ #category : 'test converting' }
InfinityClassTest >> testConvertToBaseUnit [

	self assert: infinity convertToBaseUnit equals: infinity
]

{ #category : 'test accessing' }
InfinityClassTest >> testDenominator [

	self assert: infinity denominator equals: 1
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testDivide [

	self
		should: [ infinity / infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Infinity and Infinity' ].
	self
		should: [ infinity / minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity / infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Minus Infinity and Infinity' ].
	self assert: 9 / infinity equals: 0.
	self
		should: [ infinity / 9 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Infinity and 9' ]
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testDivideByUnit [

	self assert: (infinity divideByUnit: meter) equals: 0 * meter
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testDivideMeasure [

	self assert: (infinity divideMeasure: meter * 5) equals: 0
]

{ #category : 'test comparing' }
InfinityClassTest >> testEqualsMeasure [

	| measure |

	measure := (BaseUnit named: 'peso') with: 5.
	self assert: (infinity equalsMeasure: infinity).
	self deny: (infinity equalsMeasure: measure)
]

{ #category : 'test comparing' }
InfinityClassTest >> testEqualsMeasureBag [

	| measureBag |

	measureBag := ((BaseUnit named: 'peso') with: 5) + ((BaseUnit named: 'dollar') with: 5).
	self assert: (infinity equalsMeasureBag: infinity).
	self deny: (infinity equalsMeasureBag: measureBag)
]

{ #category : 'test testing' }
InfinityClassTest >> testIsMeasureBag [

	self deny: infinity isMeasureBag
]

{ #category : 'test testing' }
InfinityClassTest >> testIsNothing [

	self deny: infinity isNothing
]

{ #category : 'test magnitude protocol' }
InfinityClassTest >> testMax [

	self assert: (infinity max: 5) equals: infinity.
	self assert: (5 max: infinity) equals: infinity.
	self assert: (infinity max: minusInfinity) equals: infinity.
	self assert: (minusInfinity max: infinity) equals: infinity.
	self assert: (infinity max: infinity) equals: infinity
]

{ #category : 'test magnitude protocol' }
InfinityClassTest >> testMin [

	self assert: (infinity min: 5) equals: 5.
	self assert: (5 min: infinity) equals: 5.
	self assert: (infinity min: minusInfinity) equals: minusInfinity.
	self assert: (minusInfinity min: infinity) equals: minusInfinity.
	self assert: (infinity min: infinity) equals: infinity
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testModulo [

	self
		should: [ infinity // infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Infinity and Infinity' ].
	self
		should: [ infinity // minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity // infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Minus Infinity and Infinity' ].
	self assert: 9 // infinity equals: 0.

	self
		should: [ infinity // 9 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Modulo operation is indeterminate between Infinity and 9' ]
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testModuloMeasure [

	self assert: (infinity moduloMeasure: 5 * meter) equals: 0
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testMultiplication [

	self assert: infinity * infinity equals: infinity.
	self assert: 9 * infinity equals: infinity.
	self assert: -9 * infinity equals: minusInfinity.
	self assert: infinity * 9 equals: infinity.
	self assert: infinity * -9 equals: minusInfinity.
	self assert: infinity * minusInfinity equals: minusInfinity.
	self assert: minusInfinity * infinity equals: minusInfinity.

	self
		should: [ 0 * infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Infinity' ].

	self
		should: [ infinity * 0 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Infinity' ]
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testMultiplyByUnit [

	self
		assert: (infinity multiplyByUnit: meter)
		equals: infinity * meter
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testMultiplyMeasure [

	self assert: (infinity multiplyMeasure: 5 * meter) equals: infinity
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testNegated [

	self assert: infinity negated equals: minusInfinity
]

{ #category : 'test testing' }
InfinityClassTest >> testNegative [

	self deny: infinity negative
]

{ #category : 'test accessing' }
InfinityClassTest >> testNumerator [

	self assert: infinity numerator equals: infinity
]

{ #category : 'test testing' }
InfinityClassTest >> testPositive [

	self assert: infinity positive
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testRemainder [

	self
		should: [ infinity \\ infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Infinity and Infinity' ].
	self
		should: [ infinity \\ minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity \\ infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Minus Infinity and Infinity' ].
	self
		should: [ infinity \\ 9 ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Remainder operation is indeterminate between Infinity and 9' ].
	self
		should: [ 9 \\ infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Infinity' ]
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testRemainderMeasure [

	self
		should: [ infinity remainderMeasure: 5 * meter ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Multiplication operation is indeterminate between 0 and Infinity' ]
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testRoundTo [

	self assert: (infinity roundTo: 2) equals: infinity
]

{ #category : 'test testing' }
InfinityClassTest >> testSameDomainAs [

	self assert: (infinity sameDomainAs: 1).
	self deny: (infinity sameDomainAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : 'test testing' }
InfinityClassTest >> testSameUnitAs [

	self assert: (infinity sameUnitAs: 1).
	self deny: (infinity sameUnitAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testSubtract [

	self
		should: [ infinity - infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Subtract operation is indeterminate between Infinity and Infinity' ].
	self
		should: [ infinity - minusInfinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Subtract operation is indeterminate between Infinity and Minus Infinity' ].
	self
		should: [ minusInfinity - infinity ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Subtract operation is indeterminate between Minus Infinity and Infinity' ].
	self assert: 9 - infinity equals: minusInfinity.
	self assert: infinity - 9 equals: infinity
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToBy [

	| interval |
	interval := infinity to: infinity by: 5.
	self
		assert: interval from equals: infinity;
		assert: interval to equals: infinity;
		assert: interval size equals: infinity;
		assert: interval by equals: 5
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToFromFixed [

	| interval |
	interval := 5 toInfinity.
	self
		assert: interval from equals: 5;
		assert: interval to equals: infinity;
		assert: interval size equals: infinity;
		assert: interval by equals: 1
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToInfinity [

	| interval |
	interval := infinity to: infinity.
	self
		assert: interval from equals: infinity;
		assert: interval to equals: infinity;
		assert: interval size equals: infinity;
		assert: interval by equals: 1
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToToFixed [

	| interval |
	interval := infinity to: 5.
	self
		assert: interval from equals: infinity;
		assert: interval to equals: 5;
		assert: interval size equals: infinity;
		assert: interval by equals: 1
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testTruncated [

	self assert: infinity truncated equals: infinity
]

{ #category : 'test accessing' }
InfinityClassTest >> testUnit [

	self assert: infinity unit equals: NullUnit new
]

{ #category : 'test accessing' }
InfinityClassTest >> testUnitNameOf [

	| unit |
	unit := BaseUnit named: 'meter'.
	self assert: (infinity unitNameOf: unit) equals: 'meters'
]

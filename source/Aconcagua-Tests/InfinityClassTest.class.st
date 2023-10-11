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

	self assert: infinity + infinity = infinity.
	self assert: 9 + infinity = infinity.
	self assert: infinity + 9 = infinity.
	self
		should: [infinity + minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [minusInfinity + infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Minus Infinity and Infinity']
]

{ #category : 'test accessing' }
InfinityClassTest >> testAmount [

	self assert: infinity = infinity
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

	self assert: infinity baseUnit = NullUnit new
]

{ #category : 'test magnitude protocol' }
InfinityClassTest >> testBetweenAnd [

	self assert: (infinity between: 1 and: infinity).
	self deny: (infinity between: 1 and: 10)
]

{ #category : 'test converting' }
InfinityClassTest >> testConvertAmountToBaseUnit [

	self assert: infinity convertAmountToBaseUnit = 0
]

{ #category : 'test converting' }
InfinityClassTest >> testConvertTo [

	| unit |

	unit := BaseUnit named: 'peso'.
	self
		should: [infinity convertTo: unit]
		raise: CanNotConvertMeasureException
		withExceptionDo: [:anException |
			self assert: anException description = 'It is not possible to convert Infinity to peso']
]

{ #category : 'test converting' }
InfinityClassTest >> testConvertToBaseUnit [

	self assert: infinity convertToBaseUnit = infinity
]

{ #category : 'test accessing' }
InfinityClassTest >> testDenominator [

	self assert: infinity denominator = 1
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testDivide [

	self
		should: [infinity / infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and Infinity'].
	self
		should: [infinity / minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [minusInfinity / infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and Infinity'].
	self assert: 9 / infinity = 0.
	self
		should: [infinity / 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and 9']
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testDivideByUnit [

	self assert: (infinity divideByUnit: meter) = (0 * meter)
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testDivideMeasure [

	self assert: (infinity divideMeasure: meter * 5) = 0
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

	self assert: (infinity max: 5) = infinity.
	self assert: (5 max: infinity) = infinity.
	self assert: (infinity max: minusInfinity) = infinity.
	self assert: (minusInfinity max: infinity) = infinity.
	self assert: (infinity max: infinity) = infinity
]

{ #category : 'test magnitude protocol' }
InfinityClassTest >> testMin [

	self assert: (infinity min: 5) = 5.
	self assert: (5 min: infinity) = 5.
	self assert: (infinity min: minusInfinity) = minusInfinity.
	self assert: (minusInfinity min: infinity) = minusInfinity.
	self assert: (infinity min: infinity) = infinity
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testModulo [

	self
		should: [infinity // infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and Infinity'].
	self
		should: [infinity // minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [minusInfinity // infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and Infinity'].

	self assert: 9 // infinity = 0.

	self
		should: [infinity // 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and 9']
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testModuloMeasure [

	self assert: (infinity moduloMeasure: 5 * meter) = 0
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testMultiplication [

	self assert: infinity * infinity = infinity.
	self assert: 9 * infinity = infinity.
	self assert: -9 * infinity = minusInfinity.
	self assert: infinity * 9 = infinity.
	self assert: infinity * -9 = minusInfinity.
	self assert: infinity * minusInfinity = minusInfinity.
	self assert: minusInfinity * infinity = minusInfinity.

	self
		should: [0 * infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity'].

	self
		should: [infinity * 0]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity']
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testMultiplyByUnit [

	self assert: (infinity multiplyByUnit: meter) = (infinity * meter)
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testMultiplyMeasure [

	self assert: (infinity multiplyMeasure: 5 * meter) = infinity
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testNegated [

	self assert: infinity negated = minusInfinity
]

{ #category : 'test testing' }
InfinityClassTest >> testNegative [

	self deny: infinity negative
]

{ #category : 'test accessing' }
InfinityClassTest >> testNumerator [

	self assert: infinity numerator = infinity
]

{ #category : 'test testing' }
InfinityClassTest >> testPositive [

	self assert: infinity positive
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testRemainder [

	self
		should: [infinity \\ infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and Infinity'].
	self
		should: [infinity \\ minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [minusInfinity \\ infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [infinity \\ 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and 9'].
	self
		should: [9 \\ infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity']
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testRemainderMeasure [

	self
		should: [infinity remainderMeasure: 5 * meter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity']
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testRoundTo [

	self assert: (infinity roundTo: 2) = infinity
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
		should: [infinity - infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Infinity and Infinity'].
	self
		should: [infinity - minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [minusInfinity - infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Minus Infinity and Infinity'].
	self assert: 9 - infinity = minusInfinity.
	self assert: infinity - 9 = infinity
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToBy [

	| interval |

	interval := infinity to: infinity by: 5.
	self
		assert: interval from = infinity;
		assert: interval to = infinity;
		assert: interval size = infinity;
		assert: interval by = 5
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToFromFixed [

	| interval |

	interval := 5 toInfinity.
	self
		assert: interval from = 5;
		assert: interval to = infinity;
		assert: interval size = infinity;
		assert: interval by = 1
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToInfinity [

	| interval |

	interval := infinity to: infinity.
	self
		assert: interval from = infinity;
		assert: interval to = infinity;
		assert: interval size = infinity;
		assert: interval by = 1
]

{ #category : 'test interval protocol' }
InfinityClassTest >> testToToFixed [

	| interval |

	interval := infinity to: 5.
	self
		assert: interval from = infinity;
		assert: interval to = 5;
		assert: interval size = infinity;
		assert: interval by = 1
]

{ #category : 'test arithmetic operations' }
InfinityClassTest >> testTruncated [

	self assert: infinity truncated = infinity
]

{ #category : 'test accessing' }
InfinityClassTest >> testUnit [

	self assert: infinity unit = NullUnit new
]

{ #category : 'test accessing' }
InfinityClassTest >> testUnitNameOf [

	| unit |

	unit := BaseUnit named: 'meter'.
	self assert: (infinity unitNameOf: unit) = 'meters'
]

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

	self assert: minusInfinity + minusInfinity = minusInfinity.
	self assert: 9 + minusInfinity = minusInfinity.
	self assert: minusInfinity + 9 = minusInfinity.
	self
		should: [minusInfinity + infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [infinity + minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Infinity and Minus Infinity']
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testAmount [

	self assert: minusInfinity = minusInfinity
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

	self assert: minusInfinity baseUnit = NullUnit new
]

{ #category : 'test magnitude protocol' }
MinusInfinityClassTest >> testBetweenAnd [


	self assert: (minusInfinity between: minusInfinity and: 1).
	self assert: (minusInfinity between: minusInfinity and: minusInfinity).
	self deny: (minusInfinity between: 1 and: 10)
]

{ #category : 'test converting' }
MinusInfinityClassTest >> testConvertAmountToBaseUnit [

	self assert: minusInfinity convertAmountToBaseUnit = 0
]

{ #category : 'test converting' }
MinusInfinityClassTest >> testConvertTo [

	| unit |

	unit := BaseUnit named: 'peso'.
	self
		should: [minusInfinity convertTo: unit]
		raise: CanNotConvertMeasureException
		withExceptionDo: [:anException |
			self assert:
				anException description = 'It is not possible to convert Minus Infinity to peso']
]

{ #category : 'test converting' }
MinusInfinityClassTest >> testConvertToBaseUnit [

	self assert: minusInfinity convertToBaseUnit = minusInfinity
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testDenominator [

	self assert: minusInfinity denominator = 1
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testDivide [

	self
		should: [minusInfinity / minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [minusInfinity / infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [infinity / minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and Minus Infinity'].
	self assert: 9 / minusInfinity = 0.
	self
		should: [minusInfinity / 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and 9']
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testDivideByUnit [

	self assert: (minusInfinity divideByUnit: meter) = (0 * meter)
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testDivideMeasure [

	self assert: (minusInfinity divideMeasure: meter * 5) = 0
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

	self assert: (minusInfinity max: 5) = 5.
	self assert: (5 max: minusInfinity) = 5.
	self assert: (infinity max: minusInfinity) = infinity.
	self assert: (minusInfinity max: infinity) = infinity.
	self assert: (minusInfinity max: minusInfinity) = minusInfinity
]

{ #category : 'test magnitude protocol' }
MinusInfinityClassTest >> testMin [

	self assert: (minusInfinity min: 5) = minusInfinity.
	self assert: (5 min: minusInfinity) = minusInfinity.
	self assert: (infinity min: minusInfinity) = minusInfinity.
	self assert: (minusInfinity min: infinity) = minusInfinity.
	self assert: (minusInfinity min: minusInfinity) = minusInfinity
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testModulo [

	self
		should: [minusInfinity // minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [minusInfinity // infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [infinity // minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and Minus Infinity'].
	self assert: 9 // minusInfinity = 0.
	self
		should: [minusInfinity // 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and 9']
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testModuloMeasure [

	self assert: (minusInfinity moduloMeasure: 5 * meter) = 0
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplication [

	self assert: minusInfinity * minusInfinity = infinity.
	self assert: 9 * minusInfinity = minusInfinity.
	self assert: -9 * minusInfinity = infinity.
	self assert: minusInfinity * 9 = minusInfinity.
	self assert: minusInfinity * -9 = infinity.
	self assert: minusInfinity * infinity = minusInfinity.
	self assert: infinity * minusInfinity = minusInfinity.

	self
		should: [0 * minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity'].

	self
		should: [minusInfinity * 0]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity']
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplyByUnit [

	self assert: (minusInfinity multiplyByUnit: meter) = (minusInfinity * meter)
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplyMeasure [

	self assert: (minusInfinity multiplyMeasure: 5 * meter) = minusInfinity
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testNegated [

	self assert: minusInfinity negated = infinity
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testNegative [

	self deny: minusInfinity negative
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testNumerator [

	self assert: minusInfinity numerator = minusInfinity
]

{ #category : 'test testing' }
MinusInfinityClassTest >> testPositive [

	self assert: minusInfinity positive
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testRemainder [

	self
		should: [minusInfinity \\ minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [minusInfinity \\ infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [infinity \\ minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [minusInfinity \\ 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and 9'].
	self
		should: [9 \\ minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity']
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testRemainderMeasure [

	self
		should: [minusInfinity remainderMeasure: 5 * meter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity']
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testRoundTo [

	self assert: (minusInfinity roundTo: 2) = minusInfinity
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
		should: [minusInfinity - minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [minusInfinity - infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [infinity - minusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Infinity and Minus Infinity'].
	self assert: 9 - minusInfinity = infinity.
	self assert: minusInfinity - 9 = minusInfinity
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToBy [

	| interval |

	interval := minusInfinity to: minusInfinity by: 5.
	self
		assert: interval from = minusInfinity;
		assert: interval to = minusInfinity;
		assert: interval size = infinity;
		assert: interval by = 5
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToFromFixed [

	| interval |

	interval := 5 toMinusInfinity.
	self
		assert: interval from = 5;
		assert: interval to = minusInfinity;
		assert: interval size = infinity;
		assert: interval by = 1
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToInfinity [

	| interval |

	interval := minusInfinity to: minusInfinity.
	self
		assert: interval from = minusInfinity;
		assert: interval to = minusInfinity;
		assert: interval size = infinity;
		assert: interval by = 1
]

{ #category : 'test interval protocol' }
MinusInfinityClassTest >> testToToFixed [

	| interval |

	interval := minusInfinity to: 5.
	self
		assert: interval from = minusInfinity;
		assert: interval to = 5;
		assert: interval size = infinity;
		assert: interval by = 1
]

{ #category : 'test arithmetic operations' }
MinusInfinityClassTest >> testTruncated [

	self assert: minusInfinity truncated = minusInfinity
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testUnit [

	self assert: minusInfinity unit = NullUnit new
]

{ #category : 'test accessing' }
MinusInfinityClassTest >> testUnitNameOf [

	| unit |

	unit := BaseUnit named: 'meter'.
	self assert: (minusInfinity unitNameOf: unit) = 'meters'
]

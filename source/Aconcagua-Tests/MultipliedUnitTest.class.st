Class {
	#name : 'MultipliedUnitTest',
	#superclass : 'TestCase',
	#instVars : [
		'meter',
		'second',
		'meterBySecond',
		'minusInfinity',
		'infinity'
	],
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'test support' }
MultipliedUnitTest >> assertAreProportionallyEquivalentAmountOf: aMeasure and: aNumber [
	"Avoiding asserting specific numerator/denominator in each test case, and writing this in a generic way instead, because depending on the Smalltalk dialect fraction reduction may or may not happen automatically on instance creation"

	self
		assert: aMeasure numerator amount / aMeasure denominator amount
		equals: aMeasure amount.
	self
		assert:
		(aMeasure numerator amount / aMeasure denominator amount) asFloat
		equals: aNumber asFloat
]

{ #category : 'test support' }
MultipliedUnitTest >> assertUnitOf: anArithmeticObject is: aUnit [

	self assert: (anArithmeticObject unit sameDomainAs: aUnit)
]

{ #category : 'initialization' }
MultipliedUnitTest >> setUp [

	meter := BaseUnit named: 'meter' sign: 'm'.
	second := BaseUnit named: 'second' sign: 's'.
	meterBySecond := meter * second.
	infinity := 	InfinityClass new.
	minusInfinity := 	MinusInfinityClass new
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testBaseUnit [

	self assert: meterBySecond baseUnit equals: meterBySecond
]

{ #category : 'test converting' }
MultipliedUnitTest >> testConvertAmountToBaseUnit [

	self assert: (meterBySecond convertAmountToBaseUnit: 0) equals: 0.
	self assert: (meterBySecond convertAmountToBaseUnit: 10) equals: 10
]

{ #category : 'test converting' }
MultipliedUnitTest >> testConvertToBaseUnit [

	| measure |
	
	measure := Measure amount: 10 unit: meterBySecond.
	self assert: (meterBySecond convertToBaseUnit: measure) == measure.
	
	

]

{ #category : 'test accessing' }
MultipliedUnitTest >> testDenominator [

	self assert: meterBySecond denominator equals: NullUnit new
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testDivideByDividedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self assert: meterBySecond / (meter / second) equals: second * second.
	self assert: meterBySecond / (second / meter) equals: meter * meter.
	self
		assert: (meterBySecond / (kelvin / liter)) numerator
		equals: meter * second * liter.
	self
		assert: (meterBySecond / (kelvin / liter)) denominator
		equals: kelvin
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testDivideByInfinity [

	self assert: meterBySecond / infinity equals: (meterBySecond with: 0).
	self
		should: [ infinity / meterBySecond ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Infinity and meter.second' ].
	self
		assert: (meterBySecond / infinity) numerator
		equals: (meterBySecond with: 0).
	self assert: (meterBySecond / infinity) denominator equals: 1
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testDivideByMinusInfinity [

	self
		assert: meterBySecond / minusInfinity
		equals: (meterBySecond with: 0).
	self
		should: [ minusInfinity / meterBySecond ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Minus Infinity and meter.second' ].
	self
		assert: (meterBySecond / minusInfinity) numerator
		equals: (meterBySecond with: 0).
	self assert: (meterBySecond / minusInfinity) denominator equals: 1
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testDivideByNumber [

	self assert: meterBySecond / 5 equals: (meterBySecond with: 1 / 5).
	self assertUnitOf: (meterBySecond / 5) numerator is: meterBySecond.
	self assertUnitOf: (meterBySecond / 5) denominator is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf: meterBySecond / 5
		and: 1 / 5.
	self
		assert: meterBySecond / 5.5
		equals: (meterBySecond with: 1 / 5.5).
	self assertUnitOf: (meterBySecond / 5.5) numerator is: meterBySecond.
	self assertUnitOf: (meterBySecond / 5.5) denominator is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf: meterBySecond / 5.5
		and: 1 / (55 / 10)
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testDivideBySimpleUnit [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self assert: meterBySecond / second equals: meter.
	self assert: meterBySecond / meter equals: second.
	self assert: (meterBySecond / kelvin) numerator equals: meterBySecond.
	self assert: (meterBySecond / kelvin) denominator equals: kelvin
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testDividedByMultipliedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self assert: meterBySecond / meterBySecond equals: NullUnit new.
	self
		assert: (meterBySecond / (kelvin * liter)) numerator
		equals: meterBySecond.
	self
		assert: (meterBySecond / (kelvin * liter)) denominator
		equals: kelvin * liter
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testDividedByNullUnit [

	self assert: meterBySecond / NullUnit new equals: meterBySecond
]

{ #category : 'test comparing' }
MultipliedUnitTest >> testEqualDividedUnit [

	self deny: meterBySecond = (meter / second)
]

{ #category : 'test comparing' }
MultipliedUnitTest >> testEqualMultipliedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self assert: meterBySecond equals: meterBySecond.
	self assert: meterBySecond equals: second * meter.

	self deny: meterBySecond = (meter * kelvin).
	self deny: meterBySecond = (meter * second * kelvin).
	self deny: meterBySecond = (kelvin * liter)
]

{ #category : 'test comparing' }
MultipliedUnitTest >> testEqualNullUnit [

	self deny: meterBySecond = NullUnit new
]

{ #category : 'test comparing' }
MultipliedUnitTest >> testEqualSimpleUnit [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	self deny: meterBySecond = kelvin
]

{ #category : 'test measurement creation' }
MultipliedUnitTest >> testMeasureCreation [

	self
		assert: (meterBySecond with: 10)
		equals: (Measure amount: 10 unit: meterBySecond)
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByDividedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self assert: meterBySecond * (meter / second) equals: meter * meter.
	self assert: meterBySecond * (second / meter) equals: second * second.
	self
		assert: (meterBySecond * (kelvin / liter)) numerator
		equals: meter * second * kelvin.
	self
		assert: (meterBySecond * (kelvin / liter)) denominator
		equals: liter
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByInfinity [

	self
		assert: meterBySecond * infinity
		equals: (meterBySecond with: infinity).
	self
		assert: infinity * meterBySecond
		equals: (meterBySecond with: infinity).
	self
		assert: (meterBySecond * infinity) numerator
		equals: (meterBySecond with: infinity).
	self assert: (meterBySecond * infinity) denominator equals: 1
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByMinusInfinity [

	self
		assert: meterBySecond * minusInfinity
		equals: (meterBySecond with: minusInfinity).
	self
		assert: minusInfinity * meterBySecond
		equals: (meterBySecond with: minusInfinity).
	self
		assert: (meterBySecond * minusInfinity) numerator
		equals: (meterBySecond with: minusInfinity).
	self assert: (meterBySecond * minusInfinity) denominator equals: 1
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByMultipliedUnit [

	self assert: (meterBySecond * meterBySecond) factorsSize equals: 4.
	self
		assert: ((meterBySecond * meterBySecond) factors at: 1)
		equals: meter.
	self
		assert: ((meterBySecond * meterBySecond) factors at: 2)
		equals: second.
	self
		assert: ((meterBySecond * meterBySecond) factors at: 3)
		equals: meter.
	self
		assert: ((meterBySecond * meterBySecond) factors at: 4)
		equals: second
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByNullUnit [

	self assert: meterBySecond * NullUnit new equals: meterBySecond
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByNumber [

	self assert: meterBySecond * 5 equals: (meterBySecond with: 5).
	self assertUnitOf: (meterBySecond * 5) numerator is: meterBySecond.
	self assertUnitOf: (meterBySecond * 5) denominator is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf: meterBySecond * 5
		and: 5 / 1.
	self assert: meterBySecond * 5.5 equals: (meterBySecond with: 5.5).
	self assertUnitOf: (meterBySecond * 5.5) numerator is: meterBySecond.
	self assertUnitOf: (meterBySecond * 5.5) denominator is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf: meterBySecond * 5.5
		and: 55 / 10
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyBySimpleUnit [

	self assert: (meterBySecond * second) factorsSize equals: 3.
	self assert: ((meterBySecond * second) factors at: 1) equals: meter.
	self assert: ((meterBySecond * second) factors at: 2) equals: second.
	self assert: ((meterBySecond * second) factors at: 3) equals: second
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testName [

	self assert: meterBySecond name equals: 'meter.second'
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testNameForMany [

	self assert: meterBySecond nameForMany equals: 'meters.seconds'
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testNameForOne [

	self assert: meterBySecond name equals: 'meter.second'
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testNothingAmount [

	self assert: meterBySecond nothingAmount equals: 0
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testNullMeasure [

	self assert: meterBySecond nullMeasure amount equals: 0.
	self assert: meterBySecond nullMeasure unit equals: meterBySecond
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testNumberDividedByUnit [

	self assert: 5 / meterBySecond equals: 5 / (meterBySecond with: 1).
	self assertUnitOf: (5 / meterBySecond) numerator is: NullUnit new.
	self assertUnitOf: (5 / meterBySecond) denominator is: meterBySecond.
	self
		assertAreProportionallyEquivalentAmountOf: 5 / meterBySecond
		and: 5 / 1.
	self
		assert: 5.5 / meterBySecond
		equals: 5.5 / (meterBySecond with: 1).
	self assertUnitOf: (5.5 / meterBySecond) numerator is: NullUnit new.
	self
		assertUnitOf: (5.5 / meterBySecond) denominator
		is: meterBySecond.
	self
		assertAreProportionallyEquivalentAmountOf: 5.5 / meterBySecond
		and: 55 / 10
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testNumberDividedByUnitTwice [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: 5 / kelvin / meterBySecond
		equals: 5 / (kelvin * meterBySecond with: 1).
	self
		assertUnitOf: (5 / kelvin / meterBySecond) numerator
		is: NullUnit new.
	self
		assertUnitOf: (5 / kelvin / meterBySecond) denominator
		is: kelvin * meterBySecond.
	self
		assertAreProportionallyEquivalentAmountOf:
		5 / kelvin / meterBySecond
		and: 5 / 1.
	self
		assert: 5.5 / kelvin / meterBySecond
		equals: 5.5 / (kelvin * meterBySecond with: 1).
	self
		assertUnitOf: (5.5 / kelvin / meterBySecond) numerator
		is: NullUnit new.
	self
		assertUnitOf: (5.5 / kelvin / meterBySecond) denominator
		is: kelvin * meterBySecond.
	self
		assertAreProportionallyEquivalentAmountOf:
		5.5 / kelvin / meterBySecond
		and: 55 / 10
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testNumberMultipliedByUnit [

	self assert: 5 * meterBySecond equals: (meterBySecond with: 5).
	self assertUnitOf: (5 * meterBySecond) numerator is: meterBySecond.
	self assertUnitOf: (5 * meterBySecond) denominator is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf: 5 * meterBySecond
		and: 5 / 1.
	self assert: 5.5 * meterBySecond equals: (meterBySecond with: 5.5).
	self assertUnitOf: (5.5 * meterBySecond) numerator is: meterBySecond.
	self assertUnitOf: (5.5 * meterBySecond) denominator is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf: 5.5 * meterBySecond
		and: 55 / 10
]

{ #category : 'test arithmetic operations' }
MultipliedUnitTest >> testNumberMultipliedByUnitTwice [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: 5 * kelvin * meterBySecond
		equals: (kelvin * meterBySecond with: 5).
	self
		assertUnitOf: (5 * kelvin * meterBySecond) numerator
		is: kelvin * meterBySecond.
	self
		assertUnitOf: (5 * kelvin * meterBySecond) denominator
		is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf:
		5 * kelvin * meterBySecond
		and: 5 / 1.
	self
		assert: 5.5 * kelvin * meterBySecond
		equals: (kelvin * meterBySecond with: 5.5).
	self
		assertUnitOf: (5.5 * kelvin * meterBySecond) numerator
		is: kelvin * meterBySecond.
	self
		assertUnitOf: (5.5 * kelvin * meterBySecond) denominator
		is: NullUnit new.
	self
		assertAreProportionallyEquivalentAmountOf:
		5.5 * kelvin * meterBySecond
		and: 55 / 10
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testNumerator [

	self assert: meterBySecond numerator equals: meterBySecond
]

{ #category : 'test accessing' }
MultipliedUnitTest >> testReciprocal [

	self
		assert: meterBySecond reciprocal
		equals: NullUnit new / meterBySecond
]

{ #category : 'test querying' }
MultipliedUnitTest >> testSameDomainAsDividedUnit [

	self deny: (meterBySecond sameDomainAs: (meter / second))	
	
]

{ #category : 'test querying' }
MultipliedUnitTest >> testSameDomainAsMultipliedUnit [

	| liter |

	liter := BaseUnit named: 'liter'.
	
	self assert: (meterBySecond sameDomainAs: meterBySecond).
	self deny: (meterBySecond sameDomainAs: (meter * liter)).
	self deny: (meterBySecond sameDomainAs: (liter * liter))
	
	
]

{ #category : 'test querying' }
MultipliedUnitTest >> testSameDomainAsNullUnit [

	self deny: (meterBySecond sameDomainAs: NullUnit new)
	
	
]

{ #category : 'test querying' }
MultipliedUnitTest >> testSameDomainAsSameSimpleUnit [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self deny: (meterBySecond sameDomainAs: unit).
	
	
	

]

{ #category : 'test accessing' }
MultipliedUnitTest >> testSign [

	self assert: meterBySecond sign equals: 'm.s'
]

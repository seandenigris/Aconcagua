Class {
	#name : 'DividedUnitTest',
	#superclass : 'TestCase',
	#instVars : [
		'meter',
		'second',
		'meterOverSecond'
	],
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'test support' }
DividedUnitTest >> assertAreProportionallyEquivalentAmountOf: aMeasure and: aNumber [
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
DividedUnitTest >> assertUnitOf: anArithmeticObject is: aUnit [

	self assert: (anArithmeticObject unit sameDomainAs: aUnit)
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> infinity [

	^ ArithmeticObject infinity
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> minusInfinity [

	^ ArithmeticObject minusInfinity
]

{ #category : 'initialization' }
DividedUnitTest >> setUp [

	meter := BaseUnit named: 'meter' sign: 'm'.
	second := BaseUnit named: 'second' sign: 's'.
	meterOverSecond := meter / second
]

{ #category : 'test accessing' }
DividedUnitTest >> testBaseUnit [

	self assert: meterOverSecond baseUnit equals: meterOverSecond
]

{ #category : 'test converting' }
DividedUnitTest >> testConvertAmountToBaseUnit [

	self assert: (meterOverSecond convertAmountToBaseUnit: 0) equals: 0.
	self assert: (meterOverSecond convertAmountToBaseUnit: 10) equals: 10
]

{ #category : 'test converting' }
DividedUnitTest >> testConvertToBaseUnit [

	| measure |
	
	measure := Measure amount: 10 unit: meterOverSecond.
	self assert: (meterOverSecond convertToBaseUnit: measure) == measure
]

{ #category : 'test accessing' }
DividedUnitTest >> testDenominator [

	self assert: meterOverSecond denominator equals: second
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testDivideByDividedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self assert: meterOverSecond / meterOverSecond equals: NullUnit new.
	self
		assert: (meterOverSecond / (kelvin / liter)) numerator
		equals: meter * liter.
	self
		assert: (meterOverSecond / (kelvin / liter)) denominator
		equals: second * kelvin
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testDivideByInfinity [

	self
		assert: meterOverSecond / self infinity
		equals: (meterOverSecond with: 0).
	self
		assert: (meterOverSecond / self infinity) numerator
		equals: (meter with: 0).
	self
		assert: (meterOverSecond / self infinity) denominator
		equals: (second with: 1).
	self
		should: [ self infinity / meterOverSecond ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Infinity and meter/second' ]
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testDivideByMinusInfinity [

	self
		assert: meterOverSecond / self minusInfinity
		equals: (meterOverSecond with: 0).
	self
		assert: (meterOverSecond / self minusInfinity) numerator
		equals: (meter with: 0).
	self
		assert: (meterOverSecond / self minusInfinity) denominator
		equals: (second with: 1).
	self
		should: [ self minusInfinity / meterOverSecond ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Minus Infinity and meter/second' ]
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testDivideByNumber [

	self
		assertAreProportionallyEquivalentAmountOf: meterOverSecond / 5
		and: 1 / 5.
	self assertUnitOf: (meterOverSecond / 5) numerator is: meter.
	self assertUnitOf: (meterOverSecond / 5) denominator is: second.

	self
		assertAreProportionallyEquivalentAmountOf: meterOverSecond / 5.5
		and: 1 / (55 / 10).
	self assertUnitOf: (meterOverSecond / 5.5) numerator is: meter.
	self assertUnitOf: (meterOverSecond / 5.5) denominator is: second
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testDivideBySimpleUnit [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self assert: (meterOverSecond / second) numerator equals: meter.
	self
		assert: (meterOverSecond / second) denominator
		equals: second * second.
	self assert: (meterOverSecond / kelvin) numerator equals: meter.
	self
		assert: (meterOverSecond / kelvin) denominator
		equals: second * kelvin
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testDividedByMultipliedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self
		assert: (meterOverSecond / (meter * second)) numerator
		equals: NullUnit new.
	self
		assert: (meterOverSecond / (meter * second)) denominator
		equals: second * second.
	self
		assert: (meterOverSecond / (kelvin * liter)) numerator
		equals: meter.
	self
		assert: (meterOverSecond / (kelvin * liter)) denominator
		equals: second * kelvin * liter
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testDividedByNullUnit [

	self assert: meterOverSecond / NullUnit new equals: meterOverSecond
]

{ #category : 'test comparing' }
DividedUnitTest >> testEqualDividedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self assert: meterOverSecond equals: meterOverSecond.
	self assert: meterOverSecond equals: meter / second.

	self deny: meterOverSecond = (meter / kelvin).
	self deny: meterOverSecond = (meter / second / kelvin).
	self deny: meterOverSecond = (kelvin / liter)
]

{ #category : 'test comparing' }
DividedUnitTest >> testEqualMultipliedUnit [

	self deny: meterOverSecond = (meter * second)
]

{ #category : 'test comparing' }
DividedUnitTest >> testEqualNullUnit [

	self deny: meterOverSecond = NullUnit new
]

{ #category : 'test comparing' }
DividedUnitTest >> testEqualSimpleUnit [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	self deny: meterOverSecond = kelvin
]

{ #category : 'test measurement creation' }
DividedUnitTest >> testMeasureCreation [

	self
		assert: (meterOverSecond with: 10)
		equals: (Measure amount: 10 unit: meterOverSecond)
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testMultiplyByDividedUnit [

	| kelvin liter |
	kelvin := BaseUnit named: 'kelvin'.
	liter := BaseUnit named: 'liter'.
	self
		assert: (meterOverSecond * meterOverSecond) numerator
		equals: meter * meter.
	self
		assert: (meterOverSecond * meterOverSecond) denominator
		equals: second * second.
	self assert: meterOverSecond * (second / meter) equals: NullUnit new.
	self
		assert: (meterOverSecond * (kelvin / liter)) numerator
		equals: meter * kelvin.
	self
		assert: (meterOverSecond * (kelvin / liter)) denominator
		equals: second * liter
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testMultiplyByInfinity [

	self
		assert: meterOverSecond * self infinity
		equals: (meterOverSecond with: self infinity).
	self
		assert: self infinity * meterOverSecond
		equals: (meterOverSecond with: self infinity).
	self
		assert: (meterOverSecond * self infinity) numerator
		equals: (meter with: self infinity).
	self
		assert: (meterOverSecond * self infinity) denominator
		equals: (second with: 1)
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testMultiplyByMinusInfinity [

	self
		assert: meterOverSecond * self minusInfinity
		equals: (meterOverSecond with: self minusInfinity).
	self
		assert: self minusInfinity * meterOverSecond
		equals: (meterOverSecond with: self minusInfinity).
	self
		assert: (meterOverSecond * self minusInfinity) numerator
		equals: (meter with: self minusInfinity).
	self
		assert: (meterOverSecond * self minusInfinity) denominator
		equals: (second with: 1)
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testMultiplyByMultipliedUnit [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self assert: meterOverSecond * (meter * second) equals: meter * meter.
	self
		assert: (meterOverSecond * (kelvin * kelvin)) numerator
		equals: meter * kelvin * kelvin.
	self
		assert: (meterOverSecond * (kelvin * kelvin)) denominator
		equals: second
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testMultiplyByNullUnit [

	self assert: meterOverSecond * NullUnit new equals: meterOverSecond
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testMultiplyByNumber [

	self
		assertAreProportionallyEquivalentAmountOf: meterOverSecond * 5
		and: 5 / 1.
	self assertUnitOf: (meterOverSecond * 5) numerator is: meter.
	self assertUnitOf: (meterOverSecond * 5) denominator is: second.

	self
		assertAreProportionallyEquivalentAmountOf: meterOverSecond * 5.5
		and: 55 / 10.
	self assertUnitOf: (meterOverSecond * 5.5) numerator is: meter.
	self assertUnitOf: (meterOverSecond * 5.5) denominator is: second
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testMultiplyBySimpleUnit [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self assert: meterOverSecond * second equals: meter.
	self
		assert: (meterOverSecond * meter) numerator
		equals: meter * meter.
	self assert: (meterOverSecond * meter) denominator equals: second.
	self
		assert: (meterOverSecond * kelvin) numerator
		equals: meter * kelvin.
	self assert: (meterOverSecond * kelvin) denominator equals: second
]

{ #category : 'test accessing' }
DividedUnitTest >> testName [

	self assert: meterOverSecond name equals: 'meter/second'
]

{ #category : 'test accessing' }
DividedUnitTest >> testNameForMany [

	self assert: meterOverSecond nameForMany equals: 'meters/seconds'
]

{ #category : 'test accessing' }
DividedUnitTest >> testNameForOne [

	self assert: meterOverSecond name equals: 'meter/second'
]

{ #category : 'test accessing' }
DividedUnitTest >> testNothingAmount [

	self assert: meterOverSecond nothingAmount equals: 0
]

{ #category : 'test accessing' }
DividedUnitTest >> testNullMeasure [

	self assert: meterOverSecond nullMeasure amount equals: 0.
	self assert: meterOverSecond nullMeasure unit equals: meterOverSecond
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testNumberDividedByUnit [

	| secondOverMeter |
	secondOverMeter := meterOverSecond reciprocal.

	self
		assertAreProportionallyEquivalentAmountOf: 5 / meterOverSecond
		and: 5 / 1.
	self assert: 5 / meterOverSecond equals: (secondOverMeter with: 5).
	self assertUnitOf: (5 / meterOverSecond) numerator is: second.
	self assertUnitOf: (5 / meterOverSecond) denominator is: meter.

	self
		assertAreProportionallyEquivalentAmountOf: 5.5 / meterOverSecond
		and: 55 / 10.
	self
		assert: 5.5 / meterOverSecond
		equals: (secondOverMeter with: 5.5).
	self assertUnitOf: (5.5 / meterOverSecond) numerator is: second.
	self assertUnitOf: (5.5 / meterOverSecond) denominator is: meter
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testNumberDividedByUnitTwice [

	| secondOverMeter kelvin |
	secondOverMeter := meterOverSecond reciprocal.
	kelvin := BaseUnit named: 'kelvin'.

	self
		assertAreProportionallyEquivalentAmountOf:
		5 / kelvin / meterOverSecond
		and: 5 / 1.
	self
		assert: 5 / kelvin / meterOverSecond
		equals: (secondOverMeter * (NullUnit new / kelvin) with: 5).
	self
		assertUnitOf: (5 / kelvin / meterOverSecond) numerator
		is: second.
	self
		assertUnitOf: (5 / kelvin / meterOverSecond) denominator
		is: kelvin * meter.

	self
		assertAreProportionallyEquivalentAmountOf:
		5.5 / kelvin / meterOverSecond
		and: 55 / 10.
	self
		assert: 5.5 / kelvin / meterOverSecond
		equals: (secondOverMeter * (NullUnit new / kelvin) with: 5.5).
	self
		assertUnitOf: (5.5 / kelvin / meterOverSecond) numerator
		is: second.
	self
		assertUnitOf: (5.5 / kelvin / meterOverSecond) denominator
		is: kelvin * meter
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testNumberMultipliedByUnit [

	self assertAreProportionallyEquivalentAmountOf: 5 * meterOverSecond and: 5/1.
	self assertUnitOf: (5 * meterOverSecond) numerator is: meter.
	self assertUnitOf: (5 * meterOverSecond) denominator is: second.
	
	self assertAreProportionallyEquivalentAmountOf: 5.5 * meterOverSecond and: 55/10.
	self assertUnitOf: (5.5 * meterOverSecond) numerator is: meter.
	self assertUnitOf: (5.5 * meterOverSecond) denominator is: second
]

{ #category : 'test arithmetic operations' }
DividedUnitTest >> testNumberMultipliedByUnitTwice [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	
	self assertAreProportionallyEquivalentAmountOf: 5 * kelvin * meterOverSecond and: 5/1.
	self assertUnitOf: (5 * kelvin * meterOverSecond) numerator is: kelvin * meter.
	self assertUnitOf: (5 * kelvin * meterOverSecond) denominator is: second.
	
	self assertAreProportionallyEquivalentAmountOf: 5.5 * kelvin * meterOverSecond and: 55/10.
	self assertUnitOf: (5.5 * kelvin * meterOverSecond) numerator is: kelvin * meter .
	self assertUnitOf: (5.5 * kelvin * meterOverSecond) denominator is: second
]

{ #category : 'test accessing' }
DividedUnitTest >> testNumerator [

	self assert: meterOverSecond numerator equals: meter
]

{ #category : 'test accessing' }
DividedUnitTest >> testReciprocal [

	| secondOverMeter |
	secondOverMeter := second / meter.
	self assert: meterOverSecond reciprocal equals: secondOverMeter
]

{ #category : 'test querying' }
DividedUnitTest >> testSameDomainAsDividedUnit [

	self assert: (meterOverSecond sameDomainAs: meterOverSecond).
	self deny: (meterOverSecond sameDomainAs: (second / meter))
	
	
]

{ #category : 'test querying' }
DividedUnitTest >> testSameDomainAsMultipliedUnit [

	self deny: (meterOverSecond sameDomainAs: (meter * second))
]

{ #category : 'test querying' }
DividedUnitTest >> testSameDomainAsNullUnit [

	self deny: (meterOverSecond sameDomainAs: NullUnit new)
	
	
]

{ #category : 'test querying' }
DividedUnitTest >> testSameDomainAsSameSimpleUnit [

	self deny: (meterOverSecond sameDomainAs: meter).
	
	
	

]

{ #category : 'test accessing' }
DividedUnitTest >> testSign [

	self assert: meterOverSecond sign equals: 'm/s'
]

Class {
	#name : 'BaseUnitTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'test support' }
BaseUnitTest >> assertUnitOf: anArithmeticObject is: aUnit [

	self assert: (anArithmeticObject unit sameDomainAs: aUnit)
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> infinity [

	^ ArithmeticObject infinity
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> minusInfinity [

	^ ArithmeticObject minusInfinity
]

{ #category : 'test accessing' }
BaseUnitTest >> testBaseUnit [

	| unit |
	unit := BaseUnit named: 'peso'.
	self assert: unit baseUnit equals: unit
]

{ #category : 'test converting' }
BaseUnitTest >> testConvertAmountToBaseUnit [

	| unit |
	unit := BaseUnit named: 'peso'.
	self assert: (unit convertAmountToBaseUnit: 0) equals: 0.
	self assert: (unit convertAmountToBaseUnit: 10) equals: 10
]

{ #category : 'test converting' }
BaseUnitTest >> testConvertToBaseUnit [

	| unit measure |
	
	unit := BaseUnit named: 'peso'.
	measure := Measure amount: 10 unit: unit.
	self assert: (unit convertToBaseUnit: measure) == measure
]

{ #category : 'test accessing' }
BaseUnitTest >> testDenominator [

	| unit |
	unit := BaseUnit nameForOne: 'peso' nameForMany: 'pepe'.
	self assert: unit denominator equals: NullUnit new
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByDifferentBaseUnit [

	| numerator denominator |
	numerator := BaseUnit named: 'meter'.
	denominator := BaseUnit named: 'second'.
	self assert: (numerator / denominator) numerator equals: numerator.
	self
		assert: (numerator / denominator) denominator
		equals: denominator
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByDifferentDomainDerivedUnit [

	| numerator denominator hour |
	numerator := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	denominator := ProportionalDerivedUnit
		               baseUnit: hour
		               conversionFactor: 1 / 60
		               named: 'minutes'.
	self assert: (numerator / denominator) numerator equals: numerator.
	self
		assert: (numerator / denominator) denominator
		equals: denominator
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByDivideUnitSameBaseUnitNumerator [

	| numerator denominator hour |
	numerator := BaseUnit named: 'meter'.
	denominator := BaseUnit named: 'hour'.
	self
		assert: numerator / (numerator / denominator)
		equals: denominator
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByDivideUnitSameDomainDerivedUnitNumerator [

	| meter hour centimeter |
	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit
		              baseUnit: meter
		              conversionFactor: 1 / 100
		              named: 'centimeter'.
	hour := BaseUnit named: 'hour'.
	self
		assert: (meter / (centimeter / hour)) numerator
		equals: meter * hour.
	self
		assert: (meter / (centimeter / hour)) denominator
		equals: centimeter
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByInfinity [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: kelvin / self infinity
		equals: (kelvin with: 1 / self infinity).
	self assert: (kelvin / self infinity) numerator equals: 0.
	self assert: (kelvin / self infinity) denominator equals: 1.
	self
		should: [ self infinity / kelvin ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Infinity and kelvin' ]
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByMinusInfinity [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: kelvin / self minusInfinity
		equals: (kelvin with: 1 / self minusInfinity).
	self assert: (kelvin / self minusInfinity) numerator equals: 0.
	self assert: (kelvin / self minusInfinity) denominator equals: 1.
	self
		should: [ self minusInfinity / kelvin ]
		raise: IndeterminateOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description
				equals:
				'The Division operation is indeterminate between Minus Infinity and kelvin' ]
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByMultipliedUnit [

	| numerator denominator hour |
	numerator := BaseUnit named: 'meter'.
	denominator := BaseUnit named: 'hour'.
	self
		assert: (numerator / (numerator * denominator)) numerator
		equals: NullUnit new.
	self
		assert: (numerator / (numerator * denominator)) denominator
		equals: denominator.
	self
		assert: (numerator / (denominator * denominator)) numerator
		equals: numerator.
	self
		assert: (numerator / (denominator * denominator)) denominator
		equals: denominator * denominator
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByNullUnit [

	| meter |
	meter := BaseUnit named: 'meter'.
	self assert: meter / NullUnit new equals: meter
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideByNumber [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self assert: kelvin / 5 equals: (kelvin with: 1 / 5).
	self assert: (kelvin / 5) numerator equals: (kelvin with: 1).
	self assert: (kelvin / 5) denominator equals: 5.
	self assert: kelvin / 5.5 equals: (kelvin with: 1 / 5.5).
	self
		assert: (kelvin / 5.5) numerator
		equals: (kelvin with: 1 / 5.5) numerator.
	self
		assert: (kelvin / 5.5) denominator
		equals: (kelvin with: 1 / 5.5) denominator
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideBySameBaseUnit [

	| numerator |
	numerator := BaseUnit named: 'peso'.
	self assert: numerator / numerator equals: NullUnit new
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testDivideBySameDomainDerivedUnit [

	| numerator denominator |
	numerator := BaseUnit named: 'meter'.
	denominator := ProportionalDerivedUnit
		               baseUnit: numerator
		               conversionFactor: 1 / 100
		               named: 'centimeter'.
	self assert: (numerator / denominator) numerator equals: numerator.
	self
		assert: (numerator / denominator) denominator
		equals: denominator
]

{ #category : 'test comparing' }
BaseUnitTest >> testEqualDerivedSameBaseUnit [

	| meter centimeter |

	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit baseUnit: meter conversionFactor: 1/100 named: 'centimeter'.
	
	self deny: meter = centimeter
]

{ #category : 'test comparing' }
BaseUnitTest >> testEqualDifferentBaseUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: meter = hour
]

{ #category : 'test comparing' }
BaseUnitTest >> testEqualDividedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: meter = (meter / hour)
]

{ #category : 'test comparing' }
BaseUnitTest >> testEqualMultipliedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: meter = (meter * hour)
]

{ #category : 'test comparing' }
BaseUnitTest >> testEqualNullUnit [

	| meter |

	meter := BaseUnit named: 'meter'.
	self deny: meter = NullUnit new
]

{ #category : 'test comparing' }
BaseUnitTest >> testEqualSameBaseUnit [

	| meter |
	meter := BaseUnit named: 'meter'.
	self assert: meter equals: meter
]

{ #category : 'test measurement creation' }
BaseUnitTest >> testMeasureCreation [

	| meter |
	meter := BaseUnit named: 'meter'.
	self
		assert: (meter with: 10)
		equals: (Measure amount: 10 unit: meter)
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testMultiplyByDividedUnit [

	| meter second kelvin |
	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: (meter * (second / kelvin)) numerator
		equals: meter * second.
	self assert: (meter * (second / kelvin)) denominator equals: kelvin
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testMultiplyByInfinity [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: kelvin * self infinity
		equals: (kelvin with: self infinity).
	self
		assert: self infinity * kelvin
		equals: (kelvin with: self infinity).
	self
		assert: (kelvin * self infinity) numerator
		equals: (kelvin with: self infinity).
	self assert: (kelvin * self infinity) denominator equals: 1
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testMultiplyByMinusInfinity [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: kelvin * self minusInfinity
		equals: (kelvin with: self minusInfinity).
	self
		assert: self minusInfinity * kelvin
		equals: (kelvin with: self minusInfinity).
	self
		assert: (kelvin * self minusInfinity) numerator
		equals: (kelvin with: self minusInfinity).
	self assert: (kelvin * self minusInfinity) denominator equals: 1
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testMultiplyByMultipliedUnit [

	| meter second kelvin |
	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	kelvin := BaseUnit named: 'kelvin'.
	self assert: (meter * (second * kelvin)) factorsSize equals: 3.
	self assert: ((meter * (second * kelvin)) factors includes: meter).
	self assert: ((meter * (second * kelvin)) factors includes: second).
	self assert: ((meter * (second * kelvin)) factors includes: kelvin)
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testMultiplyByNullUnit [

	| meter |
	meter := BaseUnit named: 'meter'.
	self assert: meter * NullUnit new equals: meter
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testMultiplyByNumber [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self assert: kelvin * 5 equals: (kelvin with: 5).
	self assert: (kelvin * 5) numerator equals: (kelvin with: 5).
	self assert: (kelvin * 1) denominator equals: 1.
	self assert: kelvin * 5.5 equals: (kelvin with: 5.5).
	self
		assert: (kelvin * 5.5) numerator
		equals: (kelvin with: 5.5) numerator.
	self
		assert: (kelvin * 5.5) denominator
		equals: (kelvin with: 5.5) denominator
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testMultiplyBySimpleUnit [

	| meter second |
	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	self assert: (meter * second) factorsSize equals: 2.
	self assert: ((meter * second) factors includes: meter).
	self assert: ((meter * second) factors includes: second)
]

{ #category : 'test accessing' }
BaseUnitTest >> testName [

	self assert: (BaseUnit named: 'peso') name equals: 'peso'
]

{ #category : 'test accessing' }
BaseUnitTest >> testNameFor [

	| unit |
	unit := BaseUnit nameForOne: 'peso' nameForMany: 'pepe'.
	self
		assert: (unit nameFor: 0) equals: unit nameForMany;
		assert: (unit nameFor: 1) equals: unit nameForOne;
		assert: (unit nameFor: 2) equals: unit nameForMany;
		assert: (unit nameFor: 1.87) equals: unit nameForMany;
		assert: (unit nameFor: 0.11) equals: unit nameForMany
]

{ #category : 'test accessing' }
BaseUnitTest >> testNameForMany [

	self assert: (BaseUnit named: 'peso') nameForMany equals: 'pesos'.
	self
		assert: (BaseUnit named: 'peso' sign: '$') nameForMany
		equals: 'pesos'.
	self
		assert:
		(BaseUnit nameForOne: 'peso' nameForMany: 'pepe') nameForMany
		equals: 'pepe'.
	self
		assert: (BaseUnit nameForOne: 'peso' nameForMany: 'pepe' sign: '$')
				nameForMany
		equals: 'pepe'
]

{ #category : 'test accessing' }
BaseUnitTest >> testNameForOne [

	| unit |
	unit := BaseUnit named: 'peso'.
	self assert: unit name equals: unit nameForOne
]

{ #category : 'test accessing' }
BaseUnitTest >> testNameForUndefinedAmount [

	| baseUnit |
	baseUnit := BaseUnit nameForOne: 'peso' nameForMany: 'pesos'.
	self
		assert: baseUnit nameForUndefinedAmount
		equals: baseUnit nameForMany
]

{ #category : 'test accessing' }
BaseUnitTest >> testNothingAmount [

	self assert: (BaseUnit named: 'peso') nothingAmount equals: 0
]

{ #category : 'test accessing' }
BaseUnitTest >> testNullMeasure [

	| unit |
	unit := BaseUnit named: 'peso'.
	self assert: unit nullMeasure amount equals: 0.
	self assert: unit nullMeasure unit equals: unit
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testNumberDividedByUnit [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: 5 / kelvin
		equals: (Measure amount: 5 unit: NullUnit new / kelvin).
	self
		assert: 5 / (kelvin with: 1)
		equals: (Measure amount: 5 unit: NullUnit new / kelvin).
	self assertUnitOf: (5 / kelvin) numerator is: NullUnit new.
	self assertUnitOf: (5 / kelvin) denominator is: kelvin.
	self assertUnitOf: (5 / (kelvin with: 1)) numerator is: NullUnit new.
	self assertUnitOf: (5 / (kelvin with: 1)) denominator is: kelvin.
	self assert: 5.5 / kelvin equals: 5.5 / (kelvin with: 1).
	self assertUnitOf: (5.5 / kelvin) numerator is: NullUnit new.
	self assertUnitOf: (5.5 / kelvin) denominator is: kelvin
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testNumberDividedByUnitTwice [

	| kelvin meter |
	kelvin := BaseUnit named: 'kelvin'.
	meter := BaseUnit named: 'meter'.
	self
		assert: 5 / kelvin / meter
		equals: (Measure amount: 5 unit: NullUnit new / (kelvin * meter)).
	self assertUnitOf: (5 / kelvin / meter) numerator is: NullUnit new.
	self
		assertUnitOf: (5 / kelvin / meter) denominator
		is: kelvin * meter.
	self
		assert: 5.5 / kelvin / meter
		equals: 5.5 / (kelvin * meter with: 1).
	self assertUnitOf: (5.5 / kelvin / meter) numerator is: NullUnit new.
	self
		assertUnitOf: (5.5 / kelvin / meter) denominator
		is: kelvin * meter
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testNumberMultipliedByUnit [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	self assert: 5 * kelvin equals: (kelvin with: 5).
	self assertUnitOf: (5 * kelvin) numerator is: kelvin.
	self assertUnitOf: (5 * kelvin) denominator is: NullUnit new.
	self assertUnitOf: (5 * (kelvin with: 1)) numerator is: kelvin.
	self
		assertUnitOf: (5 * (kelvin with: 1)) denominator
		is: NullUnit new.
	self assert: 5.5 * kelvin equals: (kelvin with: 5.5).
	self
		assert: (5.5 * kelvin) numerator
		equals: (kelvin with: 5.5) numerator.
	self
		assert: (5.5 * kelvin) denominator
		equals: (kelvin with: 5.5) denominator
]

{ #category : 'test arithmetic operations' }
BaseUnitTest >> testNumberMultipliedByUnitTwice [

	| kelvin meter |
	kelvin := BaseUnit named: 'kelvin'.
	meter := BaseUnit named: 'meter'.
	self assert: 5 * kelvin * meter equals: (kelvin * meter with: 5).
	self assertUnitOf: (5 * kelvin * meter) numerator is: kelvin * meter.
	self assertUnitOf: (5 * kelvin * meter) denominator is: NullUnit new.
	self assert: 5.5 * kelvin * meter equals: (kelvin * meter with: 5.5).
	self
		assert: (5.5 * kelvin * meter) numerator
		equals: (kelvin * meter with: 5.5) numerator.
	self
		assert: (5.5 * kelvin * meter) denominator
		equals: (kelvin * meter with: 5.5) denominator
]

{ #category : 'test accessing' }
BaseUnitTest >> testNumerator [

	| unit |
	unit := BaseUnit nameForOne: 'peso' nameForMany: 'pepe'.
	self assert: unit numerator equals: unit
]

{ #category : 'test printing' }
BaseUnitTest >> testPrintingCustomization [

	| unit measure |
	
	unit := DummyDollarUnit named: 'dollar'.
	measure := Measure amount: 5 unit: unit.
	self assert: measure printString equals: '$5.00'.
]

{ #category : 'test accessing' }
BaseUnitTest >> testReciprocal [

	| peso |
	peso := BaseUnit named: 'peso'.
	self assert: peso reciprocal equals: NullUnit new / peso
]

{ #category : 'test querying' }
BaseUnitTest >> testSameDomainAsDerivedUnit [

	| meter centimeter |

	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit baseUnit: meter conversionFactor: 1/100 named: 'centimeter'.
	
	self assert: (meter sameDomainAs: centimeter).	
	
	

]

{ #category : 'test querying' }
BaseUnitTest >> testSameDomainAsDerivedUnitOfOtherDomain [

	| meter hour minute|

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	minute := ProportionalDerivedUnit baseUnit: hour conversionFactor: 1/60 named: 'minute'.
	
	self deny: (meter sameDomainAs: minute).	
	
	
]

{ #category : 'test querying' }
BaseUnitTest >> testSameDomainAsDifferentBaseUnit [

	| unit metro |
	
	unit := BaseUnit named: 'peso'.
	metro := BaseUnit named: 'metro'.
	self deny: (unit sameDomainAs: metro)
	
	

]

{ #category : 'test querying' }
BaseUnitTest >> testSameDomainAsDividedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (meter sameDomainAs: (meter / hour))
	
	
]

{ #category : 'test querying' }
BaseUnitTest >> testSameDomainAsMultipliedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (meter sameDomainAs: (meter * hour))
	
	
]

{ #category : 'test querying' }
BaseUnitTest >> testSameDomainAsNullUnit [

	| meter |

	meter := BaseUnit named: 'meter'.
	self deny: (meter sameDomainAs: NullUnit new)
	
	
]

{ #category : 'test querying' }
BaseUnitTest >> testSameDomainAsSameBaseUnit [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self assert: (unit sameDomainAs: unit).
	
	
	

]

{ #category : 'test accessing' }
BaseUnitTest >> testSign [

	self
		assert: (BaseUnit named: 'peso') sign
		equals: BaseUnit defaultSign.
	self assert: (BaseUnit named: 'peso' sign: '$') sign equals: '$'.
	self
		assert:
		(BaseUnit nameForOne: 'peso' nameForMany: 'pepe' sign: '$') sign
		equals: '$'
]

Class {
	#name : 'ProportionalDerivedUnitTest',
	#superclass : 'TestCase',
	#instVars : [
		'peso',
		'centavo'
	],
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'initialization' }
ProportionalDerivedUnitTest >> setUp [

	peso := BaseUnit named: 'peso'.
	centavo := ProportionalDerivedUnit baseUnit: peso conversionFactor: (1/100) named: 'centavo'
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testBaseUnit [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit baseUnit equals: peso
]

{ #category : 'test converting' }
ProportionalDerivedUnitTest >> testConversionFactor [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit conversionFactor equals: 1 / 100
]

{ #category : 'test converting' }
ProportionalDerivedUnitTest >> testConvertAmountToBaseUnit [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: (unit convertAmountToBaseUnit: 0) equals: 0.
	self assert: (unit convertAmountToBaseUnit: 1) equals: 1 / 100.
	self assert: (unit convertAmountToBaseUnit: 100) equals: 1
]

{ #category : 'test converting' }
ProportionalDerivedUnitTest >> testConvertToBaseUnit [

	| unit measure |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	measure := Measure amount: 100 unit: unit.
	self assert: (unit convertToBaseUnit: measure) amount equals: 1.
	self assert: (unit convertToBaseUnit: measure) unit equals: peso
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testDenominator [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit denominator equals: NullUnit new
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideByDifferentBaseUnit [

	| meter |
	meter := BaseUnit named: 'meter'.
	self assert: (centavo / meter) numerator equals: centavo.
	self assert: (centavo / meter) denominator equals: meter
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideByDifferentDomainDerivedUnit [

	| minutes hour |
	hour := BaseUnit named: 'hour'.
	minutes := ProportionalDerivedUnit
		           baseUnit: hour
		           conversionFactor: 1 / 60
		           named: 'minutes'.
	self assert: (centavo / minutes) numerator equals: centavo.
	self assert: (centavo / minutes) denominator equals: minutes
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideByDivideUnitSameDerivedUnitNumerator [

	| meter |
	meter := BaseUnit named: 'meter'.
	self assert: centavo / (centavo / meter) equals: meter
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideByDividedUnitSameBaseUnitNumerator [

	| hour |
	hour := BaseUnit named: 'hour'.
	self
		assert: (centavo / (peso / hour)) numerator
		equals: centavo * hour.
	self assert: (centavo / (peso / hour)) denominator equals: peso
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideByMultipliedUnit [

	| meter |
	meter := BaseUnit named: 'meter'.
	self
		assert: (centavo / (centavo * meter)) numerator
		equals: NullUnit new.
	self assert: (centavo / (centavo * meter)) denominator equals: meter.
	self assert: (centavo / (meter * meter)) numerator equals: centavo.
	self
		assert: (centavo / (meter * meter)) denominator
		equals: meter * meter
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideByNullUnit [

	self assert: centavo / NullUnit new equals: centavo
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideBySameBaseUnit [

	self assert: centavo / centavo equals: NullUnit new
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testDivideBySameDomainDerivedUnit [

	| tenCents |
	tenCents := ProportionalDerivedUnit
		            baseUnit: peso
		            conversionFactor: 1 / 10
		            named: 'diez centavos'.
	self assert: (centavo / tenCents) numerator equals: centavo.
	self assert: (centavo / tenCents) denominator equals: tenCents
]

{ #category : 'test comparing' }
ProportionalDerivedUnitTest >> testEqualDerivedSameBaseUnit [

	| tenCents |
	
	tenCents := ProportionalDerivedUnit baseUnit: peso conversionFactor: 1/10 named: 'diez centavos'.	
	self deny: centavo = tenCents
]

{ #category : 'test comparing' }
ProportionalDerivedUnitTest >> testEqualDifferentBaseUnit [

	| meter |

	meter := BaseUnit named: 'meter'.
	self deny: centavo = meter
]

{ #category : 'test comparing' }
ProportionalDerivedUnitTest >> testEqualDividedUnit [

	|  hour |

	hour := BaseUnit named: 'hour'.
	self deny: centavo = (centavo / hour)
]

{ #category : 'test comparing' }
ProportionalDerivedUnitTest >> testEqualMultipliedUnit [

	| hour |

	hour := BaseUnit named: 'hour'.
	self deny: centavo = (centavo * hour)
]

{ #category : 'test comparing' }
ProportionalDerivedUnitTest >> testEqualNullUnit [

	self deny: centavo = NullUnit new
]

{ #category : 'test comparing' }
ProportionalDerivedUnitTest >> testEqualSameBaseUnit [

	self deny: centavo = peso
]

{ #category : 'test comparing' }
ProportionalDerivedUnitTest >> testEqualSameDerivedUnit [

	self assert: centavo equals: centavo
]

{ #category : 'test measurement creation' }
ProportionalDerivedUnitTest >> testMeasureCreation [

	self
		assert: (centavo with: 10)
		equals: (Measure amount: 10 unit: centavo)
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testMultiplyByDividedUnit [

	| second kelvin |
	second := BaseUnit named: 'second'.
	kelvin := BaseUnit named: 'kelvin'.
	self
		assert: (centavo * (second / kelvin)) numerator
		equals: centavo * second.
	self assert: (centavo * (second / kelvin)) denominator equals: kelvin
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testMultiplyByMultipliedUnit [

	| second kelvin |
	second := BaseUnit named: 'second'.
	kelvin := BaseUnit named: 'kelvin'.
	self assert: (centavo * (second * kelvin)) factorsSize equals: 3.
	self assert:
		((centavo * (second * kelvin)) factors includes: centavo).
	self assert: ((centavo * (second * kelvin)) factors includes: second).
	self assert: ((centavo * (second * kelvin)) factors includes: kelvin)
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testMultiplyByNullUnit [

	self assert: centavo * NullUnit new equals: centavo
]

{ #category : 'test arithmetic operations' }
ProportionalDerivedUnitTest >> testMultiplyBySimpleUnit [

	| second |
	second := BaseUnit named: 'second'.
	self assert: (centavo * second) factorsSize equals: 2.
	self assert: ((centavo * second) factors includes: centavo).
	self assert: ((centavo * second) factors includes: second)
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testName [

	self
		assert: (ProportionalDerivedUnit
				 baseUnit: peso
				 conversionFactor: 1 / 100
				 named: 'centavo') name
		equals: 'centavo'
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testNameForMany [

	self
		assert: (ProportionalDerivedUnit
				 baseUnit: peso
				 conversionFactor: 1 / 100
				 named: 'centavo') nameForMany
		equals: 'centavos'.
	self
		assert: (ProportionalDerivedUnit
				 baseUnit: peso
				 conversionFactor: 1 / 100
				 named: 'centavo'
				 sign: '$') nameForMany
		equals: 'centavos'.
	self
		assert: (ProportionalDerivedUnit
				 baseUnit: peso
				 conversionFactor: 1 / 100
				 nameForOne: 'centavo'
				 nameForMany: 'pepe'
				 sign: '$') nameForMany
		equals: 'pepe'
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testNameForOne [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit name equals: unit nameForOne
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testNothingAmount [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit nothingAmount equals: 0
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testNullMeasure [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit nullMeasure amount equals: 0.
	self assert: unit nullMeasure unit equals: peso
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testNumerator [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit numerator equals: unit
]

{ #category : 'test printing' }
ProportionalDerivedUnitTest >> testPrintingCustomization [

	| unit measure |
	
	unit := DummyCentUnit baseUnit: DummyDollarUnit new conversionFactor: 1/100 named: 'cent'.
	measure := Measure amount: 5 unit: unit.
	self assert: measure printString equals: '5c USD'.
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testReciprocal [

	| unit |
	unit := ProportionalDerivedUnit
		        baseUnit: peso
		        conversionFactor: 1 / 100
		        named: 'centavo'.
	self assert: unit reciprocal equals: NullUnit new / unit
]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsDerivedUnit [

	| tenCents |
	
	tenCents := ProportionalDerivedUnit baseUnit: peso conversionFactor: 1/10 named: 'diez centavos'.	
	
	self assert: (centavo sameDomainAs: tenCents).	
	
	

]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsDerivedUnitOfOtherDomain [

	| hour minute|

	hour := BaseUnit named: 'hour'.
	minute := ProportionalDerivedUnit baseUnit: hour conversionFactor: 1/60 named: 'minute'.
	
	self deny: (centavo sameDomainAs: minute).	
	
	
]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsDifferentBaseUnit [

	| meter |
	
	meter := BaseUnit named: 'meter'.
	self deny: (centavo sameDomainAs: meter)
	
	

]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsDividedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (centavo sameDomainAs: (meter / hour))	
]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsMultipliedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (centavo sameDomainAs: (meter * hour))	
]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsNullUnit [

	self deny: (centavo sameDomainAs: NullUnit new)
	
	
]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsSameBaseUnit [

	self assert: (centavo sameDomainAs: peso)
]

{ #category : 'test querying' }
ProportionalDerivedUnitTest >> testSameDomainAsUnit [

	self assert: (centavo sameDomainAs: centavo)
]

{ #category : 'test accessing' }
ProportionalDerivedUnitTest >> testSign [

	self
		assert: (ProportionalDerivedUnit
				 baseUnit: peso
				 conversionFactor: 1 / 100
				 named: 'centavo') sign
		equals: ProportionalDerivedUnit defaultSign.
	self
		assert: (ProportionalDerivedUnit
				 baseUnit: peso
				 conversionFactor: 1 / 100
				 named: 'centavo'
				 sign: '$') sign
		equals: '$'.
	self
		assert: (ProportionalDerivedUnit
				 baseUnit: peso
				 conversionFactor: 1 / 100
				 nameForOne: 'peso'
				 nameForMany: 'pepe'
				 sign: '$') sign
		equals: '$'
]

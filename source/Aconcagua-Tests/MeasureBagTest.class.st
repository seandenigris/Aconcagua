Class {
	#name : 'MeasureBagTest',
	#superclass : 'TestCase',
	#instVars : [
		'units'
	],
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'resources' }
MeasureBagTest class >> resources [

	^Array with: UnitsTestResource
]

{ #category : 'accessing temperature units' }
MeasureBagTest >> celsius [

	^units celsius
]

{ #category : 'accessing monetary units' }
MeasureBagTest >> centavo [
	
	^units centavo
]

{ #category : 'accessing distance units' }
MeasureBagTest >> centimeter [
	
	^units centimeter
]

{ #category : 'bag creation' }
MeasureBagTest >> createBagWith: aMeasure [ 
	
	^aMeasure createBagWithMeasure: self
]

{ #category : 'accessing monetary units' }
MeasureBagTest >> dollar [

	^units dollar
]

{ #category : 'accessing monetary units' }
MeasureBagTest >> euro [

	^units euro
]

{ #category : 'accessing monetary units' }
MeasureBagTest >> euroCent [
	
	^units euroCent
]

{ #category : 'accessing temperature units' }
MeasureBagTest >> fahrenheit [

	^units fahrenheit
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> fivePesos [

	^Measure amount: 5 unit: self peso
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> fortyDollars [

	^Measure amount: 40 unit: self dollar
]

{ #category : 'accessing distance units' }
MeasureBagTest >> kilometer [
	
	^units kilometer
]

{ #category : 'accessing distance units' }
MeasureBagTest >> meter [

	^units meter
]

{ #category : 'accessing distance units' }
MeasureBagTest >> metro [

	^units metro
]

{ #category : 'accessing distance units' }
MeasureBagTest >> millimeter [
	
	^units millimeter
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> minusTenDollars [

	^Measure amount: -10 unit: self dollar
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> minusTenPesos [
	
	^Measure amount: -10 unit: self peso
]

{ #category : 'accessing temperature measurements' }
MeasureBagTest >> oneCelsius [

	^Measure amount: 1 unit: self celsius
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> oneDollar [
	
	^Measure amount: 1 unit: self dollar
]

{ #category : 'accessing temperature measurements' }
MeasureBagTest >> oneFahrenheit [

	^Measure amount: 1 unit: self fahrenheit
]

{ #category : 'accessing distance measurements' }
MeasureBagTest >> oneKilometer [
	
	^Measure amount: 1 unit: self kilometer
]

{ #category : 'accessing distance measurements' }
MeasureBagTest >> oneMeter [
	
	^Measure amount: 1 unit: self meter
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> onePeso [

	^Measure amount: 1 unit: self peso
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> oneQuarter [
	
	^Measure amount: 1 unit: self quarter
]

{ #category : 'accessing monetary units' }
MeasureBagTest >> peso [

	^units peso
]

{ #category : 'accessing monetary units' }
MeasureBagTest >> quarter [
	
	^units quarter
]

{ #category : 'initialization' }
MeasureBagTest >> setUp [

	units := UnitsTestResource current
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> tenCentavos [
	
	^Measure amount: 10 unit: self centavo
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> tenDollars [

	^Measure amount: 10 unit: self dollar
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> tenEuros [

	^Measure amount: 10 unit: self euro
]

{ #category : 'accessing distance measurements' }
MeasureBagTest >> tenMeters [

	^Measure amount: 10 unit: self meter
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> tenPesos [
	
	^Measure amount: 10 unit: self peso
]

{ #category : 'test integer remainder' }
MeasureBagTest >> tesRemainderFractionByMeasure [

	self should: [ (1/3) \\  ( self tenPesos + self tenMeters )  ] raise: InvalidOperationException


]

{ #category : 'test add' }
MeasureBagTest >> testAdd [

	| measureBag |
	measureBag := self tenPesos + self twentyDollars.
	self assert: measureBag numberOfMeasures equals: 2.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.

	measureBag := self tenPesos + self twentyDollars + self tenEuros.
	self assert: measureBag numberOfMeasures equals: 3.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self
		assert: (measureBag atSameBaseUnitAs: self euro)
		equals: self tenEuros
]

{ #category : 'test add' }
MeasureBagTest >> testAddAssociativity [

	self
		assert: self tenPesos + self twentyDollars + self tenEuros
		equals: self tenPesos + (self twentyDollars + self tenEuros)
]

{ #category : 'test add' }
MeasureBagTest >> testAddBags [

	| result |
	result := self tenPesos + self twentyDollars
	          + (self tenEuros + self tenPesos).
	self
		assert: (result atSameBaseUnitAs: self peso)
		equals: self twentyPesos.
	self
		assert: (result atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self
		assert: (result atSameBaseUnitAs: self euro)
		equals: self tenEuros.
	self assert: result numberOfMeasures equals: 3.

	result := self tenPesos + self twentyDollars + self tenEuros.
	self
		assert: (result atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (result atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self
		assert: (result atSameBaseUnitAs: self euro)
		equals: self tenEuros.
	self assert: result numberOfMeasures equals: 3
]

{ #category : 'test add' }
MeasureBagTest >> testAddCommutativity [

	self
		assert: self tenPesos + self twentyDollars
		equals: self twentyDollars + self tenPesos.
	self
		assert: self tenPesos + self twentyDollars + self tenEuros
		equals: self tenEuros + self tenPesos + self twentyDollars.
	self
		assert: self tenPesos + self twentyDollars + self tenEuros
		equals: self twentyDollars + self tenEuros + self tenPesos.
	self
		assert: self tenPesos + self twentyDollars + self tenEuros
		equals: self twentyDollars + self tenPesos + self tenEuros
]

{ #category : 'test add' }
MeasureBagTest >> testAddEquality [

	self
		assert: self tenPesos + self twentyDollars
		equals: self tenPesos + self twentyDollars.
	self
		assert: self tenEuros + self tenPesos + self twentyDollars
		equals: self tenEuros + self tenPesos + self twentyDollars
]

{ #category : 'test add' }
MeasureBagTest >> testAddExistingUnit [

	| measureBag |
	measureBag := self tenPesos + self twentyDollars.
	measureBag := measureBag + self tenPesos.
	self assert: measureBag numberOfMeasures equals: 2.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self twentyPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars
]

{ #category : 'test add' }
MeasureBagTest >> testAddFloatWithMeasure [

	self
		assert:
		(10.01 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self meter)
		equals: self tenMeters.
	self
		assert:
		(10.01 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self peso)
		equals: self tenPesos.
	self
		assert: (10.01 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 NullUnit new)
		equals: 10.01
]

{ #category : 'test add' }
MeasureBagTest >> testAddFractionWithMeasure [

	self
		assert:
		(1 / 3 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self meter)
		equals: self tenMeters.
	self
		assert:
		(1 / 3 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self peso)
		equals: self tenPesos.
	self
		assert: (1 / 3 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 NullUnit new)
		equals: 1 / 3
]

{ #category : 'test add' }
MeasureBagTest >> testAddImmutability [

	| a10pesosPlus20Dollars |
	a10pesosPlus20Dollars := self tenPesos + self twentyDollars.
	a10pesosPlus20Dollars + self tenPesos.
	self
		assert: a10pesosPlus20Dollars
		equals: self tenPesos + self twentyDollars
]

{ #category : 'test add' }
MeasureBagTest >> testAddIntegerWithMeasure [

	self
		assert:
		(10 + (self tenMeters + self tenPesos) atSameBaseUnitAs: self meter)
		equals: self tenMeters.
	self
		assert:
		(10 + (self tenMeters + self tenPesos) atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert:
		(10 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 NullUnit new)
		equals: 10
]

{ #category : 'test add' }
MeasureBagTest >> testAddNothing [

	self
		assert: self zeroPesos + self twentyDollars
		equals: self twentyDollars.
	self assert: self zeroPesos + self zeroDollars equals: self zeroPesos.
	self
		assert: self zeroPesos + self zeroDollars
		equals: self zeroDollars
]

{ #category : 'test add' }
MeasureBagTest >> testAddScaledDecimalWithMeasure [

	self
		assert:
			(10.01s2 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 self meter)
		equals: self tenMeters.
	self
		assert:
			(10.01s2 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 self peso)
		equals: self tenPesos.
	self
		assert:
			(10.01s2 + (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 NullUnit new)
		equals: 10.01s2
]

{ #category : 'test accessing' }
MeasureBagTest >> testAtSameBaseUnitAsWithBaseUnits [

	| measureBag |
	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self assert: (measureBag atSameBaseUnitAs: self euro) equals: 0
]

{ #category : 'test accessing' }
MeasureBagTest >> testAtSameBaseUnitAsWithDerivedUnits [

	| measureBag |
	measureBag := MeasureBag with: self tenCentavos with: self oneQuarter.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenCentavos.
	self
		assert: (measureBag atSameBaseUnitAs: self centavo)
		equals: self tenCentavos.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenCentavos convertToBaseUnit.
	self
		assert: (measureBag atSameBaseUnitAs: self centavo)
		equals: self tenCentavos convertToBaseUnit.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self oneQuarter.
	self
		assert: (measureBag atSameBaseUnitAs: self quarter)
		equals: self oneQuarter.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self oneQuarter convertToBaseUnit.
	self
		assert: (measureBag atSameBaseUnitAs: self quarter)
		equals: self oneQuarter convertToBaseUnit.
	self assert: (measureBag atSameBaseUnitAs: self euroCent) equals: 0
]

{ #category : 'test' }
MeasureBagTest >> testConvertAmountToBaseUnit [

	self
		should: [ (self tenPesos + self tenDollars) convertAmountToBaseUnit ]
		raise: Exception
		withExceptionDo: [ :anException |
			self assert: (anException description indexOfSubCollection:
					 'Unit of a MeasureBag is not defined') > 0 ]
]

{ #category : 'test instance creation' }
MeasureBagTest >> testCreationWithMeasures [

	| measures measureBag |
	measures := OrderedCollection
		            with: self tenPesos
		            with: self twentyDollars
		            with: self tenEuros.
	measureBag := MeasureBag measures: measures.
	self assert: measureBag numberOfMeasures equals: 3.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self
		assert: (measureBag atSameBaseUnitAs: self euro)
		equals: self tenEuros
]

{ #category : 'test' }
MeasureBagTest >> testCreationWithMeasuresCopiesCollection [
	"This test verifies that when bag is created using the private message  #measures:,
	the collection that goes as collaborating is copied"

	| measures measureBag |
	measures := OrderedCollection
		            with: self tenPesos
		            with: self twentyDollars
		            with: self tenEuros.
	measureBag := MeasureBag measures: measures.

	measures add: self oneMeter.
	self assert: measureBag numberOfMeasures equals: 3.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self
		assert: (measureBag atSameBaseUnitAs: self euro)
		equals: self tenEuros
]

{ #category : 'test division' }
MeasureBagTest >> testDivideByMeasure [

	self
		assert: self tenPesos + self twentyDollars / self tenPesos
		equals: self twentyDollars / self tenPesos + 1
]

{ #category : 'test division' }
MeasureBagTest >> testDivision [

	self
		assert: self tenPesos + self twentyDollars / 10
		equals: self onePeso + self twoDollars.
	self
		assert: self tenPesos + self twentyDollars / -10
		equals: self onePeso negated - self twoDollars.
	self
		assert: self tenPesos + self twentyDollars / 3
		equals: (Measure amount: 10 / 3 unit: self peso)
			+ (Measure amount: 20 / 3 unit: self dollar)
]

{ #category : 'test division' }
MeasureBagTest >> testDivisionDistributivity [

	self
		assert:
		self tenPesos + self tenDollars / (self tenPesos + self tenDollars)
		equals: self tenPesos + self tenDollars / self tenPesos
			+ (self tenPesos + self tenDollars / self tenDollars)
]

{ #category : 'test division' }
MeasureBagTest >> testDivisionFloatByMeasure [

	self
		assert: 1.01 / (self tenPesos + self tenDollars)
		equals: (MeasureBagFraction
				 numerator: 1.01
				 denominator: self tenPesos + self tenDollars)
]

{ #category : 'test division' }
MeasureBagTest >> testDivisionFractionByMeasure [

	self
		assert: 1 / 3 / (self tenPesos + self tenDollars)
		equals: (MeasureBagFraction
				 numerator: 1 / 3
				 denominator: self tenPesos + self tenDollars)
]

{ #category : 'test division' }
MeasureBagTest >> testDivisionIntegerByMeasure [

	self
		assert: 1 / (self tenPesos + self tenDollars)
		equals: (MeasureBagFraction
				 numerator: 1
				 denominator: self tenPesos + self tenDollars)
]

{ #category : 'test division' }
MeasureBagTest >> testDivisionMeasureByMeasureBag [

	self
		assert: self tenPesos / (self tenPesos + self tenDollars)
		equals: (MeasureBagFraction
				 numerator: self tenPesos
				 denominator: self tenPesos + self tenDollars)
]

{ #category : 'test division' }
MeasureBagTest >> testDivisionScaledDecimalByMeasure [

	self
		assert: 23.76s2 / (self tenPesos + self tenDollars)
		equals: (MeasureBagFraction
				 numerator: 23.76s2
				 denominator: self tenPesos + self tenDollars)
]

{ #category : 'test comparing' }
MeasureBagTest >> testEqual [

	self
		assert: (MeasureBag with: self tenPesos with: self twentyDollars)
		equals: (MeasureBag with: self tenPesos with: self twentyDollars).
	self
		assert: (MeasureBag with: self tenPesos with: self twentyDollars)
		equals: (MeasureBag with: self twentyDollars with: self tenPesos).
	self
		assert: (MeasureBag measures: (OrderedCollection
					  with: self tenPesos
					  with: self twentyDollars
					  with: self tenEuros))
		equals: (MeasureBag measures: (OrderedCollection
					  with: self tenEuros
					  with: self twentyDollars
					  with: self tenPesos)).

	self deny: (MeasureBag with: self tenPesos with: self twentyDollars)
		= (MeasureBag
				 with: self tenPesos + self onePeso
				 with: self twentyDollars)
]

{ #category : 'test comparing' }
MeasureBagTest >> testEqualAllNothing [

	self
		assert: (MeasureBag with: self zeroPesos with: self zeroDollars)
		equals: (MeasureBag with: self zeroPesos with: self zeroDollars).
	self
		assert: (MeasureBag with: self zeroPesos with: self zeroDollars)
		equals: self zeroPesos.
	self
		assert: (MeasureBag with: self zeroPesos with: self zeroDollars)
		equals: self zeroDollars
]

{ #category : 'test comparing' }
MeasureBagTest >> testEqualNumber [

	self assert: (MeasureBag with: self zeroPesos with: 1) equals: 1.
	self assert: 1 equals: (MeasureBag with: self zeroPesos with: 1)
]

{ #category : 'test comparing' }
MeasureBagTest >> testEqualOneNothing [

	self
		assert: (MeasureBag with: self zeroPesos with: self tenDollars)
		equals: (MeasureBag with: self zeroPesos with: self tenDollars).
	self
		assert: (MeasureBag with: self zeroPesos with: self tenDollars)
		equals: (MeasureBag with: self tenDollars with: self zeroPesos).
	self
		assert: (MeasureBag with: self zeroPesos with: self tenDollars)
		equals: self tenDollars.
	self
		assert: (MeasureBag with: self tenDollars with: self zeroPesos)
		equals: self tenDollars
]

{ #category : 'test comparing' }
MeasureBagTest >> testEqualWithDifferentBagSizeButRepresentSameEntity [

	self
		assert: (MeasureBag with: self onePeso with: self zeroDollars)
		equals: (MeasureBag measures: (Array with: self onePeso))
]

{ #category : 'test comparing' }
MeasureBagTest >> testEqualWithDifferentBagSizeIsNothing [

	self
		assert: (MeasureBag with: self zeroPesos with: self zeroDollars)
		equals: (MeasureBag measures: (Array with: self zeroPesos))
]

{ #category : 'test comparing' }
MeasureBagTest >> testHash [

	self
		assert:
		(MeasureBag with: self tenPesos with: self twentyDollars) hash
		equals:
		(MeasureBag with: self tenPesos with: self twentyDollars) hash.
	self
		assert:
		(MeasureBag with: self tenPesos with: self twentyDollars) hash
		equals:
		(MeasureBag with: self twentyDollars with: self tenPesos) hash.
	self
		assert: (MeasureBag measures: (OrderedCollection
					  with: self tenPesos
					  with: self twentyDollars
					  with: self tenEuros)) hash
		equals: (MeasureBag measures: (OrderedCollection
					  with: self tenEuros
					  with: self twentyDollars
					  with: self tenPesos)) hash.

	self deny:
		(MeasureBag with: self tenPesos with: self twentyDollars) hash
		= (MeasureBag
				 with: self tenPesos + self onePeso
				 with: self twentyDollars) hash
]

{ #category : 'test comparing' }
MeasureBagTest >> testHashAllNothing [

	self
		assert:
		(MeasureBag with: self zeroPesos with: self zeroDollars) hash
		equals:
		(MeasureBag with: self zeroPesos with: self zeroDollars) hash.
	self
		assert:
		(MeasureBag with: self zeroPesos with: self zeroDollars) hash
		equals: self zeroPesos hash.
	self
		assert:
		(MeasureBag with: self zeroPesos with: self zeroDollars) hash
		equals: self zeroDollars hash
]

{ #category : 'test comparing' }
MeasureBagTest >> testHashOneNothing [

	self
		assert: (MeasureBag with: self zeroPesos with: self tenDollars) hash
		equals: (MeasureBag with: self zeroPesos with: self tenDollars) hash.
	self
		assert: (MeasureBag with: self zeroPesos with: self tenDollars) hash
		equals: (MeasureBag with: self tenDollars with: self zeroPesos) hash.
	self
		assert: (MeasureBag with: self zeroPesos with: self tenDollars) hash
		equals: self tenDollars hash.
	self
		assert: (MeasureBag with: self tenDollars with: self zeroPesos) hash
		equals: self tenDollars hash
]

{ #category : 'test truncated' }
MeasureBagTest >> testInvalidTruncated [

	self
		should: [ (3 / (self tenPesos + self tenDollars)) truncated ]
		raise: InvalidUnaryOperationException
		withExceptionDo: [ :anException |
			self assert: anException description notNil.
			self
				assert: anException operand
				equals: 3 / (self tenPesos + self tenDollars).
			self assert: anException operationName equals: 'truncated' ]
]

{ #category : 'test' }
MeasureBagTest >> testIsFraction [

	self deny: ((self peso with: 10.01) + (self dollar with: 20.5)) isFraction
]

{ #category : 'test testing' }
MeasureBagTest >> testIsMeasurementBag [

	self assert: ((self peso with: 10.01) + (self dollar with: 20.5)) isMeasureBag
]

{ #category : 'test testing' }
MeasureBagTest >> testIsNothing [

	self assert: (self zeroPesos + self zeroDollars) isNothing.
	self assert: ((self tenPesos + self tenDollars) - (self tenPesos + self tenDollars)) isNothing
]

{ #category : 'test magnitude protocol' }
MeasureBagTest >> testLessThan [
	"Not supported in bags..."

	self should: [ (self tenPesos + self tenDollars) < (self tenPesos + self tenDollars) ] raise: Exception
]

{ #category : 'test instance creation' }
MeasureBagTest >> testMeasureBagImmutability [

	| measureBag measures |
	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.
	measures := measureBag measures.
	measures add: self tenEuros.
	self assert: measureBag numberOfMeasures equals: 2.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars
]

{ #category : 'test accessing' }
MeasureBagTest >> testMeasures [

	| measureBag |
	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.
	self assert: measureBag measures size equals: 2.
	self assert: (measureBag measures includes: self tenPesos).
	self assert: (measureBag measures includes: self twentyDollars).
	self deny: (measureBag measures includes: 0)
]

{ #category : 'test integer division' }
MeasureBagTest >> testModulo [

	self
		assert: self tenPesos + self twentyDollars // 8
		equals: self onePeso + self twoDollars.
	self
		assert: self tenPesos + self twentyDollars // -11
		equals: self onePeso negated - self twoDollars.
	self
		assert: self tenPesos + self twentyDollars // 3
		equals: (Measure amount: 10 // 3 unit: self peso)
			+ (Measure amount: 20 // 3 unit: self dollar)
]

{ #category : 'test integer division' }
MeasureBagTest >> testModuloFloatByMeasure [

	self should: [ 1.01 // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : 'test integer division' }
MeasureBagTest >> testModuloFractionByMeasure [

	self should: [ (1/3) // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : 'test integer division' }
MeasureBagTest >> testModuloIntegerByMeasure [

	self should: [ 1 // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : 'test integer division' }
MeasureBagTest >> testModuloMeasure [

	self should: [ self tenPesos // (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : 'test integer division' }
MeasureBagTest >> testModuloMeasureBag [

	self should: [ (self tenPesos + self tenDollars) // (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : 'test integer division' }
MeasureBagTest >> testModuloScaledDecimalByMeasure [

	self should: [ 23.76s2 // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplication [

	self
		assert: self tenPesos + self twentyDollars * 2
		equals: self twentyPesos + self fortyDollars.
	self
		assert: self tenPesos + self twentyDollars + self tenEuros * 2
		equals: self twentyPesos + self fortyDollars + self twentyEuros
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplicationByMeasure [

	self
		assert: self tenPesos + self twentyDollars * self tenPesos
		equals:
		self tenPesos * self tenPesos + (self tenPesos * self twentyDollars)
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplicationByZero [

	self assert: (self tenPesos + self twentyDollars * 0) isNothing.
	self
		assert: self tenPesos + self twentyDollars * 0 + self tenPesos
		equals: self tenPesos.
	self
		assert: self tenPesos + self twentyDollars * 0 - self tenPesos
		equals: self tenPesos negated
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplicationCommutativity [

	self
		assert: self tenPesos + self twentyDollars * (25 / 10)
		equals: 25 / 10 * (self tenPesos + self twentyDollars).
	self
		assert: self tenPesos * (self tenPesos + self tenDollars)
		equals: self tenPesos + self tenDollars * self tenPesos
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplicationDistributivity [

	self
		assert: self tenPesos + self twentyDollars * 2
		equals: self tenPesos * 2 + (self twentyDollars * 2).
	self
		assert: self tenPesos + self twentyDollars * 2
		equals: self tenPesos + self twentyDollars
			+ (self tenPesos + self twentyDollars).
	self
		assert: self tenPesos + self twentyDollars
			+ (self tenPesos + self twentyDollars) * 2
		equals: self tenPesos + self twentyDollars * 2
			+ (self tenPesos + self twentyDollars * 2).
	self
		assert:
		self tenPesos + self tenDollars * (self tenPesos + self tenDollars)
		equals: self tenPesos + self tenDollars * self tenPesos
			+ (self tenPesos + self tenDollars * self tenDollars)
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplyFloatByMeasure [

	self
		assert: 1.01 * (self tenPesos + self tenMeters)
		equals: self tenPesos * 1.01 + (self tenMeters * 1.01)
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplyFractionByMeasure [

	self
		assert: 1 / 3 * (self tenPesos + self tenMeters)
		equals: 1 / 3 * self tenPesos + (1 / 3 * self tenMeters)
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplyIntegerByMeasure [

	self
		assert: 3 * (self tenPesos + self tenMeters)
		equals: 3 * self tenPesos + (3 * self tenMeters)
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplyMeasureByMeasureBag [

	self
		assert: self tenPesos * (self tenPesos + self tenDollars)
		equals:
		self tenPesos * self tenPesos + (self tenPesos * self tenDollars)
]

{ #category : 'test multiplication' }
MeasureBagTest >> testMultiplyScaledDecimalByMeasure [

	self
		assert: 23.76s2 * (self tenPesos + self tenMeters)
		equals: 23.76s2 * self tenPesos + (23.76s2 * self tenMeters)
]

{ #category : 'test subtract' }
MeasureBagTest >> testNegated [

	self
		assert: self minusTenPesos + self minusTenDollars
		equals: (self tenPesos + self tenDollars) negated
]

{ #category : 'test subtract' }
MeasureBagTest >> testNegatedDistribution [

	self
		assert: self tenPesos negated + self tenDollars negated
		equals: (self tenPesos + self tenDollars) negated.
	self
		assert: (self tenPesos + self twentyDollars) negated negated
		equals: self tenPesos + self twentyDollars
]

{ #category : 'test subtract' }
MeasureBagTest >> testNegatedZeroBag [

	self assert: ((self tenPesos + self twentyDollars) - (self tenPesos + self twentyDollars) ) negated isNothing.

]

{ #category : 'test comparing' }
MeasureBagTest >> testNotEqual [

	self deny: (MeasureBag with: self zeroPesos with: 1) = 'hello'.
	self deny: 'hello' = (MeasureBag with: self zeroPesos with: 1).

	self deny: (MeasureBag with: self zeroPesos with: 1) = Object new.
	self deny: Object new = (MeasureBag with: self zeroPesos with: 1)
]

{ #category : 'test accessing' }
MeasureBagTest >> testNumberOfMeasures [

	| measureBag |
	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.
	self assert: measureBag numberOfMeasures equals: 2.
	self
		assert: measureBag numberOfMeasures
		equals: measureBag measures size
]

{ #category : 'test printing' }
MeasureBagTest >> testPrintingForMany [

	self assert: self tenPesos printString = '10 pesos' description: 'Printing for many with correct creation'.
	self assert: self tenDollars printString = '10 dollars' description: 'Printing for many with invalid creation'.
	
	
]

{ #category : 'test printing' }
MeasureBagTest >> testPrintingForOne [

	self assert: self onePeso printString = '1 peso' description: 'Printing for one with correct creation'.
	self assert: self oneDollar printString = '1 dollar' description: 'Printing for one with invalid creation'.
	
	
]

{ #category : 'test' }
MeasureBagTest >> testRemFrom [

	self
		should: [(self oneKilometer + self fivePesos) remFrom: self oneKilometer]
		raise: InvalidBinaryOperationException
]

{ #category : 'test integer remainder' }
MeasureBagTest >> testRemainder [

	self
		assert: self tenPesos + self twentyDollars \\ 9
		equals: self onePeso + self twoDollars.
	self
		assert: self tenPesos + self twentyDollars \\ -11
		equals: self onePeso negated - self twoDollars.
	self
		assert: self tenPesos + self twentyDollars \\ 3
		equals: (Measure amount: 10 \\ 3 unit: self peso)
			+ (Measure amount: 20 \\ 3 unit: self dollar)
]

{ #category : 'test integer remainder' }
MeasureBagTest >> testRemainderFloatByMeasure [

	self should: [ 1.01 \\ ( self tenPesos + self tenMeters )  ] raise: InvalidOperationException


]

{ #category : 'test integer remainder' }
MeasureBagTest >> testRemainderIntegerByMeasure [

	self should: [ 1 \\  ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


]

{ #category : 'test integer remainder' }
MeasureBagTest >> testRemainderMeasure [

	self should: [ self tenPesos \\ (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : 'test integer remainder' }
MeasureBagTest >> testRemainderMeasureBag [

	self should: [ (self tenPesos + self tenDollars) \\ (self tenPesos + self tenDollars) ] raise: InvalidOperationException


]

{ #category : 'test integer remainder' }
MeasureBagTest >> testRemainderScaledDecimalByMeasure [

	self should: [23.76s2 \\ ( self tenPesos + self tenMeters )  ] raise: InvalidOperationException


]

{ #category : 'test' }
MeasureBagTest >> testRoundTo [

	self
		assert: (self oneKilometer + self fivePesos roundTo: 1)
		equals: self oneKilometer + self fivePesos
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtract [

	| measureBag |
	measureBag := self tenPesos - self twentyDollars.
	self assert: measureBag numberOfMeasures equals: 2.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars negated.

	measureBag := self tenPesos - self twentyDollars - self tenEuros.
	self assert: measureBag numberOfMeasures equals: 3.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars negated.
	self
		assert: (measureBag atSameBaseUnitAs: self euro)
		equals: self tenEuros negated
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractBags [

	| result |
	result := self tenPesos + self twentyDollars
	          - (self tenEuros + self tenPesos).
	self assert: (result atSameBaseUnitAs: self peso) isNothing.
	self
		assert: (result atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self
		assert: (result atSameBaseUnitAs: self euro)
		equals: self tenEuros negated.
	self assert: result numberOfMeasures equals: 2.

	result := self tenPesos + self twentyDollars - self tenEuros.
	self
		assert: (result atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (result atSameBaseUnitAs: self dollar)
		equals: self twentyDollars.
	self
		assert: (result atSameBaseUnitAs: self euro)
		equals: self tenEuros negated.
	self assert: result numberOfMeasures equals: 3
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractEquality [

	self
		assert: self tenPesos - self twentyDollars
		equals: self tenPesos - self twentyDollars.
	self
		assert: self tenEuros - self tenPesos - self twentyDollars
		equals: self tenEuros - self tenPesos - self twentyDollars
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractExistingUnit [

	| measureBag measure |
	measureBag := self tenPesos - self twentyDollars.
	measure := measureBag - self tenPesos.
	self assert: measure equals: self twentyDollars negated
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractFloatWithMeasure [

	self
		assert:
		(10.01 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self meter)
		equals: self tenMeters negated.
	self
		assert:
		(10.01 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self peso)
		equals: self tenPesos negated.
	self
		assert: (10.01 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 NullUnit new)
		equals: 10.01
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractFractionWithMeasure [

	self
		assert:
		(1 / 3 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self meter)
		equals: self tenMeters negated.
	self
		assert:
		(1 / 3 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 self peso)
		equals: self tenPesos negated.
	self
		assert: (1 / 3 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 NullUnit new)
		equals: 1 / 3
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractIntegerWithMeasure [

	self
		assert:
		(10 - (self tenMeters + self tenPesos) atSameBaseUnitAs: self meter)
		equals: self tenMeters negated.
	self
		assert:
		(10 - (self tenMeters + self tenPesos) atSameBaseUnitAs: self peso)
		equals: self tenPesos negated.
	self
		assert:
		(10 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
			 NullUnit new)
		equals: 10
]

{ #category : 'test multiplication' }
MeasureBagTest >> testSubtractMeasureByMeasureBag [

	self
		assert: self tenMeters - (self tenPesos + self tenDollars)
		equals: self tenMeters - self tenPesos - self tenDollars
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractNothing [

	self
		assert: self zeroPesos - self twentyDollars
		equals: self twentyDollars negated.
	self assert: self zeroPesos - self zeroDollars equals: self zeroPesos.
	self
		assert: self zeroPesos - self zeroDollars
		equals: self zeroDollars
]

{ #category : 'test subtract' }
MeasureBagTest >> testSubtractScaledDecimalWithMeasure [

	self
		assert:
			(10.01s2 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 self meter)
		equals: self tenMeters negated.
	self
		assert:
			(10.01s2 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 self peso)
		equals: self tenPesos negated.
	self
		assert:
			(10.01s2 - (self tenMeters + self tenPesos) atSameBaseUnitAs:
				 NullUnit new)
		equals: 10.01s2
]

{ #category : 'test truncated' }
MeasureBagTest >> testTruncated [

	self
		assert:
		((self peso with: 10.01) + (self dollar with: 20.5)) truncated
		equals: self tenPesos + self twentyDollars
]

{ #category : 'test' }
MeasureBagTest >> testUnitNameOf [

	self
		should: [ self tenPesos + self tenDollars unitNameOf: self dollar ]
		raise: Exception
		withExceptionDo: [ :anException |
			self assert: (anException description indexOfSubCollection:
					 'Unit of a MeasureBag is not defined') > 0 ]
]

{ #category : 'test instance creation' }
MeasureBagTest >> testWithWithBaseUnits [

	| measureBag |
	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.
	self assert: measureBag numberOfMeasures equals: 2.
	self
		assert: (measureBag atSameBaseUnitAs: self peso)
		equals: self tenPesos.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar)
		equals: self twentyDollars
]

{ #category : 'test instance creation' }
MeasureBagTest >> testWithWithDerivedUnits [

	| measureBag |
	measureBag := MeasureBag with: self tenCentavos with: self oneQuarter.
	self assert: measureBag numberOfMeasures equals: 2.
	self
		assert: (measureBag atSameBaseUnitAs: self centavo) amount
		equals: 10 / 100.
	self
		assert: (measureBag atSameBaseUnitAs: self peso) amount
		equals: 10 / 100.
	self
		assert: (measureBag atSameBaseUnitAs: self quarter) amount
		equals: 1 / 4.
	self
		assert: (measureBag atSameBaseUnitAs: self dollar) amount
		equals: 1 / 4
]

{ #category : 'test division' }
MeasureBagTest >> testZeroDivision [

	self
		assert: self zeroPesos + self zeroDollars / 1
		equals: self zeroPesos.
	self
		assert: self zeroPesos + self zeroDollars / 1
		equals: self zeroDollars
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> thirtyPesos [

	^Measure amount: 30 unit: self peso
]

{ #category : 'accessing distance measurements' }
MeasureBagTest >> thousandMillimeters [
	
	^Measure amount: 1000 unit: self millimeter
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> twentyDollars [

	^Measure amount: 20 unit: self dollar
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> twentyEuros [
	
	^Measure amount: 20 unit: self euro
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> twentyPesos [
	
	^Measure amount: 20 unit: self peso
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> twoDollars [

	^Measure amount: 2 unit: self dollar
]

{ #category : 'accessing temperature measurements' }
MeasureBagTest >> zeroCelsius [

	^Measure amount: 0 unit: self celsius
]

{ #category : 'accessing distance measurements' }
MeasureBagTest >> zeroCentimeters [

	^Measure amount: 0 unit: self centimeter
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> zeroDollars [
	
	^Measure amount: 0 unit: self dollar
]

{ #category : 'accessing temperature measurements' }
MeasureBagTest >> zeroFahrenheit [

	^Measure amount: 0 unit: self fahrenheit
]

{ #category : 'accessing distance measurements' }
MeasureBagTest >> zeroMeters [

	^Measure amount: 0 unit: self meter
]

{ #category : 'accessing monetary measurements' }
MeasureBagTest >> zeroPesos [

	^Measure amount: 0 unit: self peso
]

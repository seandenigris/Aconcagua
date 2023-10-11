Class {
	#name : 'DerivedUnit',
	#superclass : 'SimpleUnit',
	#category : 'Aconcagua-Core-MeasureModel',
	#package : 'Aconcagua-Core',
	#tag : 'MeasureModel'
}

{ #category : 'converting - private' }
DerivedUnit >> convertAmountFromBaseUnit: aNumber [

	self subclassResponsibility
]

{ #category : 'converting - private' }
DerivedUnit >> convertFromBaseUnit: aMeasure [ 

	^Measure amount: (self convertAmountFromBaseUnit: aMeasure amount) unit: self
]

{ #category : 'converting - private' }
DerivedUnit >> convertToBaseUnit: aMeasure [ 
	
	^Measure 
		amount: (self convertAmountToBaseUnit: aMeasure amount)
		unit: self baseUnit
]

{ #category : 'accessing' }
DerivedUnit >> nothingAmount [

	^self convertAmountFromBaseUnit: self baseUnit nothingAmount
]

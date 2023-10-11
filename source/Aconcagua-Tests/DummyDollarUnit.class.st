Class {
	#name : 'DummyDollarUnit',
	#superclass : 'BaseUnit',
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'printing' }
DummyDollarUnit >> printMeasure: aMeasure on: aStream [

	aStream nextPut: $$.
	aStream nextPutAll: (aMeasure amount asFloat printPaddedWith: $0 to: 1.2).
]

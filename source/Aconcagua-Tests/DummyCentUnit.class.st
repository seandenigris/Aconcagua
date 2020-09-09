Class {
	#name : #DummyCentUnit,
	#superclass : #ProportionalDerivedUnit,
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #printing }
DummyCentUnit >> printMeasure: aMeasure on: aStream [

	aStream
		print: aMeasure amount;
		nextPutAll: 'c USD'
]

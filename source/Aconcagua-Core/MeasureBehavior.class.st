Class {
	#name : 'MeasureBehavior',
	#superclass : 'ArithmeticObject',
	#category : 'Aconcagua-Core-MeasureModel',
	#package : 'Aconcagua-Core',
	#tag : 'MeasureModel'
}

{ #category : 'accessing' }
MeasureBehavior >> hash [ 
	
	self subclassResponsibility
]

{ #category : 'testing' }
MeasureBehavior >> isZero [

	^self isNothing
]

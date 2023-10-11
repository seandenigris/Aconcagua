Class {
	#name : 'InfinityIntervalStrategy',
	#superclass : 'IntervalStrategy',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Aconcagua-Core-MeasureModel',
	#package : 'Aconcagua-Core',
	#tag : 'MeasureModel'
}

{ #category : 'initialization' }
InfinityIntervalStrategy class >> initialize [

	self initializeUniqueInstance
]

{ #category : 'initialization' }
InfinityIntervalStrategy class >> initializeUniqueInstance [

	uniqueInstance := self basicNew
]

{ #category : 'instance creation' }
InfinityIntervalStrategy class >> new [

	^uniqueInstance
]

{ #category : 'enumerating' }
InfinityIntervalStrategy >> advanceFrom: from by: by [

	^from + by
]

{ #category : 'enumerating' }
InfinityIntervalStrategy >> advanceFrom: from steps: steps by: by [

	^from + (steps * by)
]

{ #category : 'enumerating' }
InfinityIntervalStrategy >> stepsFrom: from to: to by: by [

	^ArithmeticObject infinity
]

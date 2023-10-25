Class {
	#name : 'ArithmeticObjectIntervalTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Tests-ArithmeticModel',
	#package : 'Aconcagua-Tests',
	#tag : 'ArithmeticModel'
}

{ #category : 'test accessing' }
ArithmeticObjectIntervalTest >> testAccessing [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self assert: interval from equals: 1.
	self assert: interval to equals: 10.
	self assert: interval by equals: 2
]

{ #category : 'test' }
ArithmeticObjectIntervalTest >> testAdd [

	self 
		should: [ (ArithmeticObjectInterval from: 1 to: 10 by: 1) add: 1]
		raise: Exception
]

{ #category : 'test accessing' }
ArithmeticObjectIntervalTest >> testAt [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self assert: interval first equals: 1.
	self assert: (interval at: 2) equals: 3.
	self assert: (interval at: 3) equals: 5.
	self assert: (interval at: 4) equals: 7.
	self assert: (interval at: 5) equals: 9.
	self should: [ interval at: 11 ] raise: IndexOutOfRangeException
]

{ #category : 'test comparing' }
ArithmeticObjectIntervalTest >> testComparing [

	| interval1 interval2 |
	interval1 := ArithmeticObjectInterval from: 1 to: 5 by: 2.
	interval2 := ArithmeticObjectInterval from: 1 to: 5 by: 2.
	self assert: interval1 equals: interval2.

	interval2 := ArithmeticObjectInterval from: 1 to: 5 by: 1.
	self deny: interval1 = interval2
]

{ #category : 'test' }
ArithmeticObjectIntervalTest >> testCopyAndGrowBy [

	| original copy |
	original := ArithmeticObjectInterval from: 1 to: 10 by: 1.
	copy := original copyAndGrowBy: 10.
	self assert: copy size equals: 20.
	1 to: 10 do: [ :aNumber |
	self assert: (copy at: aNumber) equals: aNumber ].
	11 to: 20 do: [ :aNumber | self assert: (copy at: aNumber) isNil ]
]

{ #category : 'test' }
ArithmeticObjectIntervalTest >> testDeepCopy [

	| original copy |
	original := ArithmeticObjectInterval from: 1 to: 10 by: 1.
	copy := original deepCopy.
	self assert: original equals: copy.
	self deny: original == copy
]

{ #category : 'test enumerating' }
ArithmeticObjectIntervalTest >> testDo [

	| interval number |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	number := 1.
	interval do: [ :aNumber |
		self assert: aNumber equals: number.
		number := number + 2 ].
	self assert: number equals: 11
]

{ #category : 'test accessing' }
ArithmeticObjectIntervalTest >> testFirst [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self assert: interval first equals: 1
]

{ #category : 'test accessing' }
ArithmeticObjectIntervalTest >> testHash [

	self
		assert: (ArithmeticObjectInterval from: 1 to: 5 by: 2) hash
		equals: (ArithmeticObjectInterval from: 1 to: 5 by: 2) hash
]

{ #category : 'test querying' }
ArithmeticObjectIntervalTest >> testIncludes [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 5 by: 2.

	self assert: (interval includes: 1).
	self assert: (interval includes: 3).
	self assert: (interval includes: 5).
	self deny: (interval includes: 0).
	self deny: (interval includes: 6).
	self deny: (interval includes: 7).
	self deny: (interval includes: 2).
	self deny: (interval includes: 4).


]

{ #category : 'test accessing' }
ArithmeticObjectIntervalTest >> testInvalidAt [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.

	self
		should: [ interval at: 0 ]
		raise: IndexOutOfRangeException
		withExceptionDo: [ :anException |
			self assert: anException description notNil.
			self assert: anException index equals: 0.
			self assert: anException collection equals: interval ].

	self
		should: [ interval at: interval size + 1 ]
		raise: IndexOutOfRangeException
]

{ #category : 'test instance creation' }
ArithmeticObjectIntervalTest >> testInvalidCreation [

	self
		should: [ ArithmeticObjectInterval from: 1 to: -1 by: 2 ]
		raise: InvalidIntervalException
		withExceptionDo: [ :anException |
			self assert: anException description notNil.
			self assert: anException from equals: 1.
			self assert: anException to equals: -1.
			self assert: anException by equals: 2 ].

	self
		should: [ ArithmeticObjectInterval from: -1 to: 1 by: -2 ]
		raise: InvalidIntervalException.
	self
		should: [ ArithmeticObjectInterval from: 1 to: 2 by: -1 ]
		raise: InvalidIntervalException.
	self
		should: [ ArithmeticObjectInterval from: -1 to: -2 by: 1 ]
		raise: InvalidIntervalException.
	self
		should: [ ArithmeticObjectInterval from: 1 to: 2 by: 0 ]
		raise: InvalidIntervalException
]

{ #category : 'test accessing' }
ArithmeticObjectIntervalTest >> testLast [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self assert: interval last equals: 9
]

{ #category : 'test' }
ArithmeticObjectIntervalTest >> testPrintOn [

	self
		assert: (ArithmeticObjectInterval from: 1 to: 10 by: 1) printString
		equals: 'Interval from: 1 to: 10 by: 1'
]

{ #category : 'test enumerating' }
ArithmeticObjectIntervalTest >> testReject [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self
		assert: (interval reject: [ :a | a > 5 ])
		equals: (Array with: 1 with: 3 with: 5)
]

{ #category : 'test' }
ArithmeticObjectIntervalTest >> testRemoveIfAbsent [

	self 
		should: [ (ArithmeticObjectInterval from: 1 to: 10 by: 1) remove: 1 ifAbsent: []]
		raise: Exception

]

{ #category : 'test enumerating' }
ArithmeticObjectIntervalTest >> testReverse [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 5 by: 2.
	self assert: interval reverse equals: (Array with: 5 with: 3 with: 1)
]

{ #category : 'test enumerating' }
ArithmeticObjectIntervalTest >> testReverseDo [

	| interval number |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	number := 9.
	interval reverseDo: [ :aNumber |
		self assert: aNumber equals: number.
		number := number - 2 ].
	self assert: number equals: -1
]

{ #category : 'test enumerating' }
ArithmeticObjectIntervalTest >> testSelect [

	| interval |
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self
		assert: (interval select: [ :a | a < 5 ])
		equals: (Array with: 1 with: 3)
]

{ #category : 'test' }
ArithmeticObjectIntervalTest >> testShallowCopy [

	| original copy |
	original := ArithmeticObjectInterval from: 1 to: 10 by: 1.
	copy := original shallowCopy.
	self assert: original equals: copy.
	self deny: original == copy
]

{ #category : 'test accessing' }
ArithmeticObjectIntervalTest >> testSize [

	self
		assert: (ArithmeticObjectInterval from: 1 to: 10 by: 2) size
		equals: 5.
	self
		assert: (ArithmeticObjectInterval from: 1 to: 10 by: 11) size
		equals: 1.
	self
		assert: (ArithmeticObjectInterval from: 1 to: 1 by: 1) size
		equals: 1.
	self
		assert: (ArithmeticObjectInterval from: 1 to: 1 by: 2) size
		equals: 1.
	self
		assert: (ArithmeticObjectInterval from: -1 to: -10 by: -2) size
		equals: 5.
	self
		assert: (ArithmeticObjectInterval from: -10 to: 10 by: 1) size
		equals: 21.
	self
		assert: (ArithmeticObjectInterval from: -10 to: -5 by: 1) size
		equals: 6
]

{ #category : 'test' }
ArithmeticObjectIntervalTest >> testStoreOn [

	| stream |
	stream := WriteStream on: String new.
	(ArithmeticObjectInterval from: 1 to: 10 by: 1) storeOn: stream.
	self
		assert: stream contents
		equals: (String streamContents: [ :aStream |
				 aStream
					 nextPutAll: '(ArithmeticObjectInterval from: ';
					 nextPutAll: 1 storeString;
					 nextPutAll: ' to: ';
					 nextPutAll: 10 storeString;
					 nextPutAll: ' by: ';
					 nextPutAll: 1 storeString;
					 nextPutAll: ')' ])
]

Class {
	#name : 'CircularReadStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'stream',
		'streamStaringInThirdElement'
	],
	#category : 'Aconcagua-Tests-MeasureModel',
	#package : 'Aconcagua-Tests',
	#tag : 'MeasureModel'
}

{ #category : 'initialization' }
CircularReadStreamTest >> setUp [

	stream := CircularReadStream on: #(1 2 3 4 5) moving: NullUnit new.
	streamStaringInThirdElement := CircularReadStream on: #(1 2 3 4 5) moving: NullUnit new startingCircleAt: 3
]

{ #category : 'test testing' }
CircularReadStreamTest >> testAtBegin [

	self assert: stream atBegin.
	stream upToEnd.
	self deny: stream atBegin.
	stream upToBegin.
	self assert: stream atBegin.

	self assert: streamStaringInThirdElement atBegin.
	self assert: streamStaringInThirdElement current equals: 3.
	streamStaringInThirdElement upToEnd.
	self deny: streamStaringInThirdElement atBegin.
	self assert: streamStaringInThirdElement current equals: 2.
	streamStaringInThirdElement upToBegin.
	self assert: streamStaringInThirdElement atBegin.
	self assert: streamStaringInThirdElement current equals: 3
]

{ #category : 'test testing' }
CircularReadStreamTest >> testAtEnd [

	self deny: stream atEnd.
	stream upToEnd.
	self assert: stream atEnd.
	stream upToBegin.
	self deny: stream atEnd.

	self deny: streamStaringInThirdElement atEnd.
	self deny: streamStaringInThirdElement current = 2.
	streamStaringInThirdElement upToEnd.
	self assert: streamStaringInThirdElement atEnd.
	self assert: streamStaringInThirdElement current equals: 2.
	streamStaringInThirdElement upToBegin.
	self deny: streamStaringInThirdElement atEnd.
	self deny: streamStaringInThirdElement current = 2
]

{ #category : 'test accessing' }
CircularReadStreamTest >> testCurrent [

	self assert: stream current equals: 1.
	stream next: 2.
	self assert: stream current equals: 3.
	stream previous: 3.
	self assert: stream current equals: 5.
	self assert: streamStaringInThirdElement current equals: 3.
	streamStaringInThirdElement next: 2.
	self assert: streamStaringInThirdElement current equals: 5.
	streamStaringInThirdElement previous: 3.
	self assert: streamStaringInThirdElement current equals: 2
]

{ #category : 'test querying' }
CircularReadStreamTest >> testDistanceFrom [

	self assert: (stream distanceFrom: 1) equals: 0.
	self assert: (stream distanceFrom: 2) equals: 4.
	self assert: (stream distanceFrom: 3) equals: 3.
	self assert: (stream distanceFrom: 4) equals: 2.
	self assert: (stream distanceFrom: 5) equals: 1
]

{ #category : 'test querying' }
CircularReadStreamTest >> testDistanceFromTo [

	self assert: (stream distanceFrom: 1 to: 1) equals: 0.
	self assert: (stream distanceFrom: 1 to: 2) equals: 1.
	self assert: (stream distanceFrom: 1 to: 3) equals: 2.
	self assert: (stream distanceFrom: 1 to: 4) equals: 3.
	self assert: (stream distanceFrom: 1 to: 5) equals: 4
]

{ #category : 'test querying' }
CircularReadStreamTest >> testDistanceTo [

	self assert: (stream distanceTo: 1) equals: 0.
	self assert: (stream distanceTo: 2) equals: 1.
	self assert: (stream distanceTo: 3) equals: 2.
	self assert: (stream distanceTo: 4) equals: 3.
	self assert: (stream distanceTo: 5) equals: 4
]

{ #category : 'test querying' }
CircularReadStreamTest >> testDistanceToFrom [

	self assert: (stream distanceTo: 1 from: 1) equals: 0.
	self assert: (stream distanceTo: 2 from: 1) equals: 1.
	self assert: (stream distanceTo: 3 from: 1) equals: 2.
	self assert: (stream distanceTo: 4 from: 1) equals: 3.
	self assert: (stream distanceTo: 5 from: 1) equals: 4
]

{ #category : 'test enumerating' }
CircularReadStreamTest >> testNext [

	self assert: stream next equals: 2.
	self assert: stream next equals: 3.
	self assert: stream next equals: 4.
	self assert: stream next equals: 5.
	self assert: stream next equals: 1
]

{ #category : 'test enumerating' }
CircularReadStreamTest >> testNextANumberOfSomething [

	self assert: (stream next: 1) equals: 2.
	self assert: (stream next: 2) equals: 4.
	self assert: (stream next: 3) equals: 2.
	self assert: (stream next: 4) equals: 1.
	self assert: (stream next: 5) equals: 1.
	self assert: (stream next: -1) equals: 5.
	self assert: (stream next: -2) equals: 3.
	self assert: (stream next: -3) equals: 5.
	self assert: (stream next: -4) equals: 1.
	self assert: (stream next: -5) equals: 1
]

{ #category : 'test enumerating' }
CircularReadStreamTest >> testPrevious [

	self assert: stream previous equals: 5.
	self assert: stream previous equals: 4.
	self assert: stream previous equals: 3.
	self assert: stream previous equals: 2.
	self assert: stream previous equals: 1.
	self assert: stream previous equals: 5
]

{ #category : 'test enumerating' }
CircularReadStreamTest >> testPreviousANumberOfSomething [

	self assert: (stream previous: 1) equals: 5.
	self assert: (stream previous: 2) equals: 3.
	self assert: (stream previous: 3) equals: 5.
	self assert: (stream previous: 4) equals: 1.
	self assert: (stream previous: 5) equals: 1.
	self assert: (stream previous: -1) equals: 2.
	self assert: (stream previous: -2) equals: 4.
	self assert: (stream previous: -3) equals: 2.
	self assert: (stream previous: -4) equals: 1.
	self assert: (stream previous: -5) equals: 1
]

{ #category : 'test querying' }
CircularReadStreamTest >> testRelativeDistanceFromTo [

	self assert: (stream relativeDistanceFrom: 1 to: 1) equals: 0.
	self assert: (stream relativeDistanceFrom: 1 to: 2) equals: 1.
	self assert: (stream relativeDistanceFrom: 1 to: 3) equals: 2.
	self assert: (stream relativeDistanceFrom: 1 to: 4) equals: 3.
	self assert: (stream relativeDistanceFrom: 1 to: 5) equals: 4.
	self assert: (stream relativeDistanceFrom: 1 to: 1) equals: 0.
	self assert: (stream relativeDistanceFrom: 2 to: 1) equals: -1.
	self assert: (stream relativeDistanceFrom: 3 to: 1) equals: -2.
	self assert: (stream relativeDistanceFrom: 4 to: 1) equals: -3.
	self assert: (stream relativeDistanceFrom: 5 to: 1) equals: -4
]

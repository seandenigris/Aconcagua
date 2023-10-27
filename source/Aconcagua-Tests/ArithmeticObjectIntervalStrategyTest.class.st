Class {
	#name : 'ArithmeticObjectIntervalStrategyTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Tests-ArithmeticModel',
	#package : 'Aconcagua-Tests',
	#tag : 'ArithmeticModel'
}

{ #category : 'test' }
ArithmeticObjectIntervalStrategyTest >> testSingleton [

	self assert: ArithmeticObjectIntervalStrategy new == ArithmeticObjectIntervalStrategy new
]

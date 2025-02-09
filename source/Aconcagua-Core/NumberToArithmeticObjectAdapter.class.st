Class {
	#name : 'NumberToArithmeticObjectAdapter',
	#superclass : 'Object',
	#instVars : [
		'number'
	],
	#category : 'Aconcagua-Core-ArithmeticModel',
	#package : 'Aconcagua-Core',
	#tag : 'ArithmeticModel'
}

{ #category : 'instance creation' }
NumberToArithmeticObjectAdapter class >> number: aNumber [
	^ self new initializeNumber: aNumber
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> * anArithmeticObject [

	^anArithmeticObject * number
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> + anArithmeticObject [

	^anArithmeticObject + number
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> - anArithmeticObject [

	^anArithmeticObject subtractFrom: number
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> / anArithmeticObject [

	^anArithmeticObject divFrom: number
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> // anArithmeticObject [

	^anArithmeticObject quoFrom: number
]

{ #category : 'comparing' }
NumberToArithmeticObjectAdapter >> < anArithmeticObject [

	^anArithmeticObject > number
]

{ #category : 'comparing' }
NumberToArithmeticObjectAdapter >> <= anArithmeticObject [

	^anArithmeticObject >= number
]

{ #category : 'comparing' }
NumberToArithmeticObjectAdapter >> = anArithmeticObject [ 

	^anArithmeticObject = number
]

{ #category : 'comparing' }
NumberToArithmeticObjectAdapter >> > anArithmeticObject [

	^anArithmeticObject < number
]

{ #category : 'comparing' }
NumberToArithmeticObjectAdapter >> >= anArithmeticObject [

	^ anArithmeticObject <= number
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> \\ anArithmeticObject [

	^anArithmeticObject remFrom: number
]

{ #category : 'comparing' }
NumberToArithmeticObjectAdapter >> hash [

	^ number hash
]

{ #category : 'initialization' }
NumberToArithmeticObjectAdapter >> initializeNumber: aNumber [

	number := aNumber
]

{ #category : 'printing' }
NumberToArithmeticObjectAdapter >> printOn: aStream [

	aStream nextPutAll: 'NumberMeasureAdapter for: '.
	number printOn: aStream
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> quo: anArithmeticObject [

	^anArithmeticObject quoFrom: number
]

{ #category : 'arithmetic operations' }
NumberToArithmeticObjectAdapter >> rem: anArithmeticObject [

	^ anArithmeticObject remFrom: number
]

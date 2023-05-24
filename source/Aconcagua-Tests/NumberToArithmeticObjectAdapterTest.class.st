Class {
	#name : #NumberToArithmeticObjectAdapterTest,
	#superclass : #TestCase,
	#category : #'Aconcagua-Tests-ArithmeticModel'
}

{ #category : #accessing }
NumberToArithmeticObjectAdapterTest class >> resources [

	^ { UnitsTestResource }
]

{ #category : #tests }
NumberToArithmeticObjectAdapterTest >> testArithmetic [

	| measure |

	measure := Measure amount: 10 unit: NullUnit new.

	self
		assert: measure + 1 equals: 11;
		assert: 1 + measure equals: 11;
		assert: measure - 1 equals: 9;
		assert: 1 - measure equals: -9;
		assert: measure * 2 equals: 20;
		assert: 2 * measure equals: 20;
		assert: measure / 2 equals: 5;
		assert: 20 / measure equals: 2
]

{ #category : #tests }
NumberToArithmeticObjectAdapterTest >> testArithmeticWithMeters [

	| meter tenMeters |

	meter := UnitsTestResource current meter.
	tenMeters := meter * 10.

	self
		assert: ( tenMeters + 1 ) isMeasureBag;
		assert: 1 + tenMeters equals: tenMeters + 1;
		assert: tenMeters + 1 equals: 1 + tenMeters;
		assert: ( tenMeters - 1 ) isMeasureBag;
		assert: ( 1 - tenMeters ) isMeasureBag;
		assert: tenMeters * 2 equals: meter * 20;
		assert: 2 * tenMeters equals: meter * 20;
		assert: tenMeters / 2 equals: meter * 5;
		assert: 20 / tenMeters equals: meter reciprocal * 2
]

{ #category : #tests }
NumberToArithmeticObjectAdapterTest >> testComparing [

	| adapter |

	adapter := NumberToArithmeticObjectAdapter number: 10.

	self
		assert: adapter equals: 10;
		assert: adapter hash equals: 10 hash;
		deny: adapter equals: 9;
		deny: adapter equals: 11;
		assert: adapter <= 10;
		assert: adapter <= 11;
		deny: adapter <= 9;
		deny: adapter < 10;
		assert: adapter < 11;
		assert: adapter >= 10;
		assert: adapter >= 9;
		deny: adapter >= 11;
		assert: adapter > 9;
		deny: adapter > 11
]

{ #category : #tests }
NumberToArithmeticObjectAdapterTest >> testPrintString [

	self
		assert: ( NumberToArithmeticObjectAdapter number: 10 ) printString
		equals: 'NumberMeasureAdapter for: 10'
]

{ #category : #tests }
NumberToArithmeticObjectAdapterTest >> testQuotient [

	| adapter |

	adapter := NumberToArithmeticObjectAdapter number: 8.
	self
		assert: ( adapter quo: 2 ) equals: 4;
		assert: adapter // 2 equals: 4.
	self
		assert: ( adapter quo: 3 ) equals: 2;
		assert: adapter // 3 equals: 2
]

{ #category : #tests }
NumberToArithmeticObjectAdapterTest >> testRemainder [

	| adapter |

	adapter := NumberToArithmeticObjectAdapter number: 8.

	self
		assert: ( adapter rem: 2 ) isNothing;
		assert: ( adapter \\ 2 ) isNothing.
	self
		assert: ( adapter rem: 3 ) equals: 2;
		assert: adapter \\ 3 equals: 2
]

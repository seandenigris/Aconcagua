"
This class is used to load Aconcagua from github repository
"
Class {
	#name : 'BaselineOfAconcagua',
	#superclass : 'BaselineOf',
	#instVars : [
		'repositories'
	],
	#category : 'BaselineOfAconcagua',
	#package : 'BaselineOfAconcagua'
}

{ #category : 'baselines' }
BaselineOfAconcagua >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
		spec
			package: 'Aconcagua-Core';
			package: 'Aconcagua-Extensions'
			with: [ spec requires: 'Aconcagua-Core' ];
			package: 'Aconcagua-Tests' with: [ spec requires: 'Deployment' ].

		spec
			group: 'Deployment' with: 'Aconcagua-Core';
			group: 'Deployment' with: 'Aconcagua-Extensions';
			group: 'Tests' with: 'Aconcagua-Tests';
			group: 'CI' with: 'Tests';
			group: 'Development' with: 'Tests' ]
]

{ #category : 'postload' }
BaselineOfAconcagua >> configureArithmeticObjectInstancesAsInvariant [

	ArithmeticObject makeInstancesInvariant
]

{ #category : 'baselines' }
BaselineOfAconcagua >> projectClass [

	^ MetacelloCypressBaselineProject

]

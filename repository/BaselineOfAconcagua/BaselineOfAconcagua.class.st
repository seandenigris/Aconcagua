"
This class is used to load Aconcagua from github repository
"
Class {
	#name : #BaselineOfAconcagua,
	#superclass : #BaselineOf,
	#instVars : [
		'repositories'
	],
	#category : 'BaselineOfAconcagua'
}

{ #category : #baselines }
BaselineOfAconcagua >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ spec
				package: 'Aconcagua-Core';
				package: 'Aconcagua-Tests' with: [ spec requires: 'Aconcagua-Core' ].

			spec
				group: 'Deployment' with: 'Aconcagua-Core';
				group: 'Tests' with: 'Aconcagua-Tests';
				group: 'CI' with: 'Tests';
				group: 'Development' with: 'Tests'
			]
]

{ #category : #accessing }
BaselineOfAconcagua >> projectClass [

	^ MetacelloCypressBaselineProject
]

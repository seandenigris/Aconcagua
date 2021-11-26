# Installation

## Basic Installation

You can load **Aconcagua** evaluating:

```smalltalk
Metacello new
  baseline: 'Aconcagua';
  repository: 'github://ba-st/Aconcagua:release-candidate/source';
  load.
```

> Change `release-candidate` to some released version if you want a pinned version

## Using as dependency

In order to include **Aconcagua** as part of your project, you should reference
the package in your product baseline:

```smalltalk
setUpDependencies: spec

  spec
    baseline: 'Aconcagua'
      with: [ spec
        repository: 'github://ba-st/Aconcagua:v{XX}/source';
        loads: #('Deployment') ];
    import: 'Aconcagua'.
```

> Replace `{XX}` with the version you want to depend on

```smalltalk
baseline: spec

  <baseline>
  spec
    for: #common
    do: [ self setUpDependencies: spec.
      spec package: 'My-Package' with: [ spec requires: #('Aconcagua') ] ]
```

## Provided groups

- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `CI` is the group loaded in the continuous integration setup
- `Development` will load all the needed packages to develop and contribute to the project

## Platform Compatibility

| Pharo version | Aconcagua version |
| ----------- | ------------- |
| < 6.0 | Go to [mtaborda repo](https://github.com/mtaborda/aconcagua) |
| 6.0 | Use version 6.0.0 |
| > 6.1 | Use version > 7.0.0 |

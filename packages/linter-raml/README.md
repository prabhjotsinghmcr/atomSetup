linter-raml
=========================

## RAML 1.0 is now supported !

[![Dependency Status](https://david-dm.org/quilicicf/linter-raml.svg)](https://david-dm.org/quilicicf/linter-raml)

This linter plugin for [Linter](https://github.com/AtomLinter/Linter) validates your [RAML](http://raml.org) files in [Atom](https://atom.io/).

It detects RAML files by extension (expects file name to be `*.raml`).

The underlying validation tool is [RAML JS parser](https://www.npmjs.com/package/raml-1-parser).

For a full RAML editing experience, install the [RAML package](https://atom.io/packages/raml).

## Ignore files

If you don't want the linter to process some files, just add the following line under the shebang:

`#linter-raml/ignore`

## Linter-RAML in application

### Single-file validation

![linter-raml in action](https://raw.githubusercontent.com/quilicicf/linter-raml/master/linter-raml-in-action.png)

### Multi-file validation

If the RAML file includes another file containing errors, you can find the errors by switching the linter in `Project` mode (the switch is at the bottom-left of the editor). All errors will then appear, you can click on the file name to open the file in Atom.

![linter-raml in action](https://raw.githubusercontent.com/quilicicf/linter-raml/master/linter-raml-multi-file.png)

## Installation

Install linter and linter-raml:
- __Linter:__ If Linter is not installed, please follow the instructions [here](https://github.com/AtomLinter/Linter).
- __Linter-raml:__ run `apm install linter-raml`

## Configuration 

You can configure this package by opening its settings view (`ctrl+,` then select the package) or by editing the entries below 'linter-raml' in _~/.atom/config.cson_.

## Contributing

You think it lacks a feature ? Spot a bug ? Unsufficient documentation ?
Any contribution is welcome, below are a few contribution guidelines but first get a look at [atom contribution guidelines](https://github.com/atom/atom/blob/master/CONTRIBUTING.md#styleguides):

1. Git
  1. Fork the plugin repository.
  1. Hack on a separate topic branch created from the latest `master`.
  1. Commit and push the topic branch.
  1. Make a pull request.
1. Code style
  1. Indent is 2 spaces.
  1. Code should pass coffeelint linter.
1. Other
  1. Let me know by mail before contributing (don't want to waste your time on something already being done)
  1. You don't know how or don't have the time to contribute ? Don't hesitate to share your ideas in issues


Thank you for helping out!

{CompositeDisposable} = require 'atom'
parser = undefined
path = undefined
_ = undefined
IGNORE_FILE_REGEX = /\n#[ \t]*linter-raml\/ignore\s*/

setTimeout () ->
  parser = require 'raml-1-parser'
  path = require 'path'
  _ = require 'lodash'
  , 0


module.exports =
  config:
    lintOnFly:
      type: 'boolean'
      title: 'Lint on fly'
      default: true

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.config.observe 'linter-raml.lintOnFly',
      (lintOnFly) =>
        @lintOnFly = lintOnFly

  deactivate: ->
    @subscriptions.dispose()

  # Public: Validates the given RAML definition.
  # * `text`      The {String} content of the definition's main file
  # * `mainFilePath`  The {String} path to the definition's main file, used to find full path to
  # errors in included files
  #
  # Returns an empty array if the RAML definition is valid, the list of error messages otherwise
  validate: (text, mainFilePath) ->
    if !path || !parser || !_
      return []

    AST = parser.loadApiSync(mainFilePath)
    errors = AST.errors()
    if !errors?.length
      return []

    return _(errors)
      .map((error) ->
        type = if error.isWarning then 'warning' else 'error'
        range = [
          [error.range.start.line, error.range.start.column],
          [error.range.end.line, error.range.end.column]
        ]

        return {
          range: range
          text: error.message
          filePath: path.join(path.dirname(mainFilePath), error.path)
          type: type
        }
      )
      .value()

  provideLinter: ->
    helpers = require('atom-linter')
    provider =
      name: 'RAML'
      grammarScopes: ['source.raml']
      scope: 'project'
      lintOnFly: @lintOnFly
      lint: (textEditor) =>
        text = textEditor.getText()
        filePath = textEditor.getPath()

        if IGNORE_FILE_REGEX.test text
          return []

        return @validate(text, filePath)

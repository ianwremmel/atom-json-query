JsonQueryOutputView = require './json-query-output-view'
JsonQueryInputView = require './json-query-input-view'

module.exports =
  jsonQueryView: null

  activate: (state) ->
    @jsonQueryOutputView = new JsonQueryOutputView()
    @jsonQueryInputView = new JsonQueryInputView()

  deactivate: ->
    @jsonQueryOutputView.destroy()
    @jsonQueryInputView.destroy()

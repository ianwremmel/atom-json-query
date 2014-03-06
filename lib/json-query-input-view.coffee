{View} = require 'atom'
jsonQuery = require 'json-query'
window.jsonQuery = jsonQuery
module.exports =
  class JsonQueryInputView extends View
    @content: ->
      @div class: 'json-query json-query-input-view', =>
        @textarea keyDown: 'onKeyDown', placeholder: 'Enter your query here'

    initialize: ->
      atom.workspaceView.command 'json-query:toggle', => @toggle()

    destroy: ->
      @detach()

    onKeyDown: (event, element) ->
      # and not (event.ctrlKey or event.altKey or event.metaKey or event.shiftKey)
      if event.keyCode is 13
        event.preventDefault()
        @evalInput element

    evalInput: (element) ->
      query = 'items'
      # query = element.val()

      editor = atom.workspace.getActiveEditor()
      text = editor.buffer.cachedText
      console.log text
      context = JSON.parse text

      console.log query, context

      result = jsonQuery query,
        context: context

      console.log result


    toggle: ->
      if @hasParent()
        @detach()
      else
        atom.workspaceView.prependToBottom this

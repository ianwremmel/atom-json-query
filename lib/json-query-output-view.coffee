{View} = require 'atom'

module.exports =
  class JsonQueryOutputView extends View
    @content: ->
      @div class: 'json-query json-query-output-view', =>
        @div 'this is where the query result will go'

    initialize: ->
      atom.workspaceView.command 'json-query:toggle', => @toggle()

    destroy: ->
      @detach()

    toggle: ->
      if @hasParent()
        @detach()
      else
        # editorElement = atom.workspaceView.find '.editor.active'
        # editorView = editorElement.view()
        # editorView.appendToRight this
        atom.workspaceView.appendToBottom this

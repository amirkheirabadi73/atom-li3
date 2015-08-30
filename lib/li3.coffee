Li3View = require './li3-view'
{CompositeDisposable} = require 'atom'

module.exports = Li3 =
  li3View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @li3View = new Li3View(state.li3ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @li3View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'li3:toggle': => @toggle()
    @subscriptions.add atom.commands.add 'atom-workspace', 'li3:name': => @name()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @li3View.destroy()

  serialize: ->
    li3ViewState: @li3View.serialize()

  toggle: ->
    console.log 'Li3 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

  name: ->
    console.log('hi');

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

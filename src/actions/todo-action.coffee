Flux = require 'material-flux'
keys = require '../keys'

class TodoAction extends Flux.Action
  addTodo: (text) ->
    @dispatch(keys.addTodo, text)
  toggleTodo: (id) ->
    @dispatch(keys.toggleTodo, id)
  removeTodo: (id) ->
    @dispatch(keys.removeTodo, id)

module.exports = TodoAction

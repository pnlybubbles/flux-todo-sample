Flux = require 'material-flux'
TodoAction = require './actions/todo-action'
TodoStore = require './stores/todo-store'

class TodoContext extends Flux.Context
  constructor: ->
    super
    @todoAction = new TodoAction(@)
    @todoStore = new TodoStore(@)

module.exports = TodoContext

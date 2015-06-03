Flux = require 'material-flux'
keys = require '../keys.coffee'

class TodoStore extends Flux.Store
  constructor: (context) ->
    super context
    @state =
      todos: []
    @register keys.addTodo, @addTodo
    @register keys.toggleTodo, @toggleTodo
    @register keys.removeTodo, @removeTodo
    @id = 0

  addTodo: (text) ->
    todo =
      id: @id
      text: text
      done: false
    @id += 1
    todos = @state.todos
    todos.push todo
    @setState
      todos: todos

  toggleTodo: (id) ->
    todos = @state.todos
    index = (t['id'] for t in todos).indexOf id
    if index != -1
      todos[index].done = !todos[index].done
    else
      throw Error("fatal error")
    @setState
      todos: todos

  removeTodo: (id) ->
    todos = @state.todos
    index = (t['id'] for t in todos).indexOf id
    if index != -1
      todos.splice index, 1
    else
      throw Error("fatal error")
    @setState
      todos: todos

  getTodo: ->
    @state.todos

module.exports = TodoStore

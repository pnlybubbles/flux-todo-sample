React = require 'react'
InputComponent = require './input-component'
ItemComponent = require './item-component'

class AppComponent extends React.Component
  constructor: (props) ->
    super props
    @todoStore = @props.context.todoStore
    @state =
      todos: @todoStore.getTodo()

  _onChange: ->
    @setState
      todos: @todoStore.getTodo()

  componentDidMount: ->
    @todoStore.onChange @_onChange.bind(@)

  componentWillUnmount: ->
    @todoStore.removeAllChangeListeners()

  toggleTodo: (id) ->
    context = @props.context
    context.todoAction.toggleTodo(id)

  addTodo: (text) ->
    context = @props.context
    context.todoAction.addTodo(text)

  removeTodo: (text) ->
    context = @props.context
    context.todoAction.removeTodo(text)

  render: ->
    <div>
      <InputComponent addTodo={ @addTodo.bind(@) } />
      <div>
        {
          @state.todos.map (todo) =>
            <li key={ todo.id }>
              <ItemComponent todo={ todo } toggleTodo={ @toggleTodo.bind(@) } removeTodo={ @removeTodo.bind(@) } />
            </li>
        }
      </div>
    </div>

module.exports = AppComponent

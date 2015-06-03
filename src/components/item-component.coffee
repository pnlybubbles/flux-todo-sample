React = require 'react'

class ItemComponent extends React.Component
  constructor: (props) ->
    super props

  toggleTodo: ->
    @props.toggleTodo @props.todo.id

  removeTodo: ->
    @props.removeTodo @props.todo.id

  render: ->
    <div>
      <div className={ if @props.todo.done then 'done' else '' } onClick={ @toggleTodo.bind(@) }>
        { @props.todo.text }
      </div>
      <span onClick={ @toggleTodo.bind(@) }>[{ if @props.todo.done then 'undone' else 'done' }]</span>
      <span onClick={ @removeTodo.bind(@) }>[remove]</span>
    </div>

ItemComponent.propTypes =
  todo: React.PropTypes.shape
    id: React.PropTypes.number.isRequired
    text: React.PropTypes.string.isRequired
    done: React.PropTypes.bool.isRequired
  toggleTodo: React.PropTypes.func.isRequired
  removeTodo: React.PropTypes.func.isRequired

module.exports = ItemComponent

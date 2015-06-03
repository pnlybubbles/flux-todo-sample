React = require 'react'

class InputComponent extends React.Component
  constructor: (props) ->
    super props
    @state =
      input: ""

  changeInput: (e) ->
    @setState
      input: e.target.value

  addTodo: ->
    @props.addTodo @state.input
    @setState
      input: ""

  render: ->
    <div>
      <input type='text' value={ @state.input } onChange={ @changeInput.bind(@) } />
      <button onClick={ @addTodo.bind(@) }>Add</button>
    </div>

InputComponent.propTypes =
  addTodo: React.PropTypes.func.isRequired

module.exports = InputComponent

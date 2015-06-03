React = require 'react'
AppContext = require './todo-context'
App = require './components/todo-component'

context = new AppContext()

React.render React.createElement(App, {context}), document.getElementById("app")

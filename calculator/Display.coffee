noflo = require "noflo"

class Display extends noflo.Component
  constructor: ->

    @inPorts =
      in: new noflo.Port()

    @inPorts.in.on "data", (data) =>
      result = data[0]
      response = data[1]
      response.render "./calc.jade", resulttext: result
      console.log(result)

exports.getComponent = -> new Display()
noflo = require "noflo"
math = require "mathjs"

class Calc extends noflo.Component
  constructor: ->

    @inPorts =
      in: new noflo.Port()
    @outPorts =
      out: new noflo.Port()

    @inPorts.in.on "data", (data) =>
      array = []
      result = math.eval(data[0])
      response = data[1]
      array[0] = result
      array[1] = response
      @outPorts.out.send array

    @inPorts.in.on "disconnect", =>
      @outPorts.out.disconnect()

exports.getComponent = -> new Calc()
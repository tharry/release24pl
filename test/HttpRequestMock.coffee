
class HttpRequestMock
  constructor: ->

  open: (aMethod, aUrl, aBool )->

  send: ( aParam ) ->
    @readyState = 4
    @status = 200
    @onreadystatechange()

module.exports = HttpRequestMock

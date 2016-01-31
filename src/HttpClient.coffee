class HttpClient
  constructor: (@request) ->

  get: (aUrl, aCallback)->
    anHttpRequest = new @request
    anHttpRequest.onreadystatechange = ()->
      if (anHttpRequest.readyState == 4 && anHttpRequest.status == 200)
        aCallback(anHttpRequest.responseText)
    anHttpRequest.open( "GET", aUrl, true )
    anHttpRequest.send( null )

module.exports = HttpClient

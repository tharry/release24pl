fs = require('fs');

class HttpClientMock
  constructor: (@request) ->

  get: (aUrl, aCallback)->
    fs.readFile __dirname + '/fixture.xml', (err, data) ->
      if err
        throw err;
      aCallback(data.toString())

module.exports = HttpClientMock

expect = require('chai').expect
MockHttpRequest = require('./HttpRequestMock')

HttpClient = require '../src/HttpClient'

hc1 = new HttpClient(MockHttpRequest)


describe "HttpClient suite", ()->
  it "get works", (done)->
    hc1.get 'a', ()->      
      done()

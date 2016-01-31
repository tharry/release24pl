expect = require('chai').expect
Release24pl = require '../src/Release24pl'
HttpClientMock = require './HttpClientMock'

httpClient = new HttpClientMock()
r1 = new Release24pl(httpClient)

describe "Release24pl suite", ()->
  it "movies work", (done)->
    r1.movies 'BDRIP', 11, (data)->
      expect(data).to.be.not.null
      expect(data.count).to.be.equal(25)
      expect(data.data).to.be.array
      expect(data.data.length).to.be.equal(25)
      expect(data.data[0].ref).to.be.equal('wpis-44961')
      expect(data.data[1].title).to.be.equal('"The Hobbit: The Battle of the Five Armies" (2014) EXTENDED.BDRip.X264-AMIABLE')
      expect(data.data[2].imdb).to.be.equal('http://www.imdb.com/title/tt0047478/')
      expect(data.data[2].filmweb).to.be.equal('http://www.filmweb.pl/film/Siedmiu+samuraj%C3%B3w-1954-31369')
      done()

cheerio = require('cheerio')

class Release24pl
  constructor: (@httpClient) ->
    # YQL query
    # select * from html where url='http://release24.pl/filmy/BDRIP/11' and xpath='/html/body/div//*[@class="wpis"]'

    # YQL endpoint
    @YQL = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20html%20where%20url%3D'http%3A%2F%2Frelease24.pl%2Ffilmy%2F2SIZE%2F2PAGE'%20and%20xpath%3D'%2Fhtml%2Fbody%2Fdiv%2F%2F*%5B%40class%3D%22wpis%22%5D'&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"

  movies: (size, page, callback)->
    proxy = @YQL.replace(/2SIZE/, size).replace(/2PAGE/, page)
    @httpClient.get proxy, (text)->
      $ = cheerio.load(text)
      query = $('query')
      result = {}
      result.count = parseInt query.attr('yahoo:count')
      result.data = $("div.wpis").map  (index, element) ->
        {
          ref: $(element).attr('id')
          title: $(element).find('h1.filmy a').text()
          imdb: $(element).find("img[alt='IMdB.com']").parent().attr('href')
          filmweb: $(element).find("img[alt='filmweb.pl']").parent().attr('href')
        }
      callback result

module.exports = Release24pl

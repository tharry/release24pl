m = require('../lib/index.js')

r1 = new m.Release24pl(new m.HttpClient(XMLHttpRequest));
r1.movies 'BDRIP', 1, (data)->
  alert(data.count)

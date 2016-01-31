expect = require('chai').expect

MainModule = require('../src/index')

describe "index suite", ()->
  it "contains Release24pl", ()->
    expect(MainModule.Release24pl).to.be.defined

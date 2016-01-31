var path = require('path');
var coffeeCoverage = require('coffee-coverage');
var projectRoot = path.resolve(__dirname, ".");
var coverageVar = coffeeCoverage.findIstanbulVariable();
// Only write a coverage report if we're not running inside of Istanbul.
var writeOnExit = (coverageVar == null) ? true : null;


coffeeCoverage.register({
    instrumentor: 'istanbul',
    basePath: projectRoot,
    exclude: ['/test', '/node_modules', '/.git', 'Gruntfile.*'],
    coverageVar: coverageVar,
    writeOnExit: writeOnExit ? ((_ref = process.env.COFFEECOV_OUT) != null ? _ref : 'coverage/coverage-coffee.json') : null,
    initAll: (_ref = process.env.COFFEECOV_INIT_ALL) !== null ? (_ref === 'true') : true
});

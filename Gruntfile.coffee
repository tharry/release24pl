module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        cwd: 'src/'
        src: ['*.coffee']
        dest: 'lib/'
        ext: '.js'
        options:
          bare: false
    mochaTest:
      options:
        reporter: 'spec'
        require: ['coffee-script/register', 'coffee-coverage-loader']
      src: ['test/*.coffee']
    shell:
      istanbul:
        command: 'node_modules/.bin/istanbul report && '+
          'see coverage/lcov-report/index.html'
    browserify:
      dist:
        src: ['lib/app.js'],
        dest: 'build/app.js'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks('grunt-browserify');

  grunt.registerTask 'istanbul', ['shell:istanbul']
  grunt.registerTask 'default', ['coffee', 'mochaTest']

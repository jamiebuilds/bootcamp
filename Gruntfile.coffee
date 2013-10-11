fs = require 'fs'

# global module: false
module.exports = (grunt) ->

  # Modules
  grunt.loadNpmTasks 'grunt-init'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # Grunt Tasks
  grunt.initConfig
    meta: version: '0.0.1'

    # Sass
    sass: test:
      options:
        style: 'expanded'
        loadPath: './dist'
      files: './test/results.css': './test/specs.scss'

    # Watch
    watch: dist:
      files: ['./dist/**/*.scss', './test/**/*.scss']
      tasks: ['sass', 'bootcamp']

  grunt.registerTask 'bootcamp', 'Log Bootcamp Results.', ->
    trim = (str) -> str.replace(/^\s\s*/, '').replace(/\s\s*$/, '')
    contents = trim fs.readFileSync('./test/results.css', 'utf8').match( /\/\* START TEST RUNNER \*\/((.|\n)*)\/\* END TEST RUNNER \*\// )[1]

    grunt.log.writeln contents

    if (contents.indexOf('FAILED') > -1 )
      grunt.fatal 'Bootcamp Tests Failed'

  # Tasks
  grunt.registerTask 'default', ['sass', 'bootcamp', 'watch']
  grunt.registerTask 'test',    ['sass', 'bootcamp']

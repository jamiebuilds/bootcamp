'use strict'

fs = require 'fs'

bootcamp = (filepath) ->
  file    = fs.readFileSync filepath, 'utf8'
  camp    = file.match( /\/\* >> Bootcamp >> \*\/((.|\n)*)\/\* << Bootcamp << \*\// )?[1]
  results = camp?.match( /Test Results \{((.|\n)*)\}/ )?[1]
  specs   = camp?.replace(results, '').replace(/Test Results \{\}|\{|\}|;|:/g, '')

  getProperty = (before) ->
    str = results?.match( new RegExp before + ': ((.|\n)*?);' )?[1].trim()
    str = parseInt str unless isNaN str
    str

  return {
    camp:       camp?.trim()
    results:    results?.trim()
    specs:      specs?.trim()
    passed:     getProperty('Passed') == 'true'
    stats:      getProperty 'Stats'
    tests:      getProperty 'Tests'
    assertions: getProperty 'Assertions'
    failures:   getProperty 'Failures'
    skipped:    getProperty 'Skipped'
  }

module.exports = (grunt) ->

  grunt.registerMultiTask 'bootcamp', 'Jasmine-style BDD testing written in Sass for Sass.', ->
    # Merge task-specific and/or target-specific options with these defaults.
    options = @options
      verbose: false

    @files.forEach (f) ->
      src = f.src.filter (filepath) ->

        # Warn on and remove invalid source files (if nonull was set).
        unless grunt.file.exists filepath
          grunt.log.warn 'Source file "' + filepath + '" not found.'
          return false

        else
          try
            tests = bootcamp( filepath )

            grunt.log.writeln '\n' + tests.specs + '\n' if tests.specs
            grunt.log.writeln tests.stats if tests.stats

            str  = (tests.tests      || 0) + ' tests, '
            str += (tests.assertions || 0) + ' assertions, '
            str += (tests.failures   || 0) + ' failures, '
            str += (tests.skipped    || 0) + ' skipped.'

            if tests.passed or tests.tests == undefined
              grunt.log.success str

              if tests.tests == undefined
                throw 'No Tests Found'

              return true
            else
              grunt.log.warn str
              return false

          catch error
            grunt.log.warn error
            grunt.log.warn 'Your tests probably haven\'t been properly set up.\nTake a look at https://github.com/tctcl/bootcamp/wiki/setup'

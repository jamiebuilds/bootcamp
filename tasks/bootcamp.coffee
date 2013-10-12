'use strict'

fs = require 'fs'

bootcamp = (filepath) ->
  file    = fs.readFileSync filepath, 'utf8'
  camp    = file.match( /\/\* >> Bootcamp >> \*\/((.|\n)*)\/\* << Bootcamp << \*\// )[1]
  results = camp.match( /Test Results \{((.|\n)*)\}/ )[1]
  specs   = camp.replace(results, '')
    .replace(/Test Results \{\}|\{|\}|;|:/g, '')

  getProperty = (before) ->
    str = results.match( new RegExp before + ': ((.|\n)*?);' )[1].trim()
    str = parseInt str unless isNaN str
    str

  return {
    camp:       camp.trim()
    results:    results.trim()
    specs:      specs.trim()
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
          tests = bootcamp( filepath )

          grunt.log.writeln '\n' + tests.specs + '\n' if tests.specs
          grunt.log.writeln tests.stats

          str  = tests.tests      + ' tests, '
          str += tests.assertions + ' assertions, '
          str += tests.failures   + ' failures, '
          str += tests.skipped    + ' skipped.'

          if tests.passed
            grunt.log.success str
            return true
          else
            grunt.fail.warn str
            return false

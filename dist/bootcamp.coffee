'use strict'

fs = require 'fs'

module.exports =
  test: (filepath) ->
    error = null

    file = fs.readFileSync filepath, 'utf8'

    ###
    # Get Camp
    ###

    camp = file.match /\/\* >> Bootcamp >> \*\/((.|\n)*)\/\* << Bootcamp << \*\//

    unless camp?
      return incomplete: true, error: 'No Test Suite Found'
    else
      camp = camp[1]

    ###
    # Get Results
    ###

    results = camp.match /Test Results \{((.|\n)*)\}/

    unless results?
      return incomplete: true, error: 'No Test Results Found'
    else
      results = results[1]

    ###
    # Get Specs
    ###

    specs = camp.replace( results, '' ).replace( /Test Results \{\}|\{|\}|;|:/g, '' )

    ###
    # method: getProperty
    ###

    getProperty = (property) ->
      value = results.match( new RegExp property + ': ((.|\n)*?);' )

      unless value?
        error = incomplete: true, error: "No #{property} Found"
        return false
      else
        value = value[1].trim()
        value = parseInt value unless isNaN value

      return value

    ###
    # Get Properties
    ###

    passed      = getProperty('Passed') == 'true'
    checklist   = getProperty 'Checklist'
    tests       = getProperty 'Tests'
    assertions  = getProperty 'Assertions'
    failures    = getProperty 'Failures'
    skipped     = getProperty 'Skipped'

    ###
    # Return Any Errors
    ###

    return error if error

    ###
    # Return Final Values
    ###

    return {
      camp:       camp
      results:    results
      specs:      specs

      passed:     passed
      checklist:  checklist
      stats:      "#{tests} Tests, #{assertions} assertions, #{failures} failures, #{skipped} skipped"

      tests:      tests
      assertions: assertions
      failures:   failures
      skipped:    skipped
    }

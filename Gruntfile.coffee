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
        style: "expanded"
      files: './test/results.css': './test/specs.scss'

    # Watch
    watch: dist:
      files: ['./dist/**/*.scss', './test/**/*.scss']
      tasks: ['sass:test']

  # Tasks
  grunt.registerTask 'default', ['sass', 'watch']

module.exports = (grunt) ->

  # Load all grunt tasks
  require('load-grunt-tasks')(grunt)

  # Show elapsed time at the end
  require('time-grunt')(grunt)

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      ' Licensed MIT */\n'
    # Task configuration
    compass:
      dist:
        options:
          sassDir: 'sass'
          cssDir: 'css'
          outputStyle: 'compressed'
    jshint:
      options:
        jshintrc: '.jshintrc'
        reporter: require('jshint-stylish')
      all: [
        'js/*.js'
        '!js/webtrends.load.js'
        '!js/webtrends.min.js'
      ]
    imagemin:
      dynamic:
        options:
          optimizationLevel: 3
          progressive: true
        files: [
          expand: true
          cwd: 'images/dist'
          src: ['**/*.{png,jpg,gif}']
          dest: 'images/'
        ]
    watch:
      gruntfile:
        files: ['Gruntfile.coffee']
      js:
        files: [
          'js/{,*/}*.js'
        ]
        tasks: ['jshint']
        options:
          livereload: true
      compass:
        files: [
          'sass/**/{,*/}*.{scss,sass}'
        ]
        tasks: ['compass']
        options:
          livereload: true
  grunt.registerTask('dev',
    [
      'compass'
      'watch'
    ])

  grunt.registerTask('compress', [
    'imagemin'
    ])
  return

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compile:
        files:
          'temp/site.js': [
            '../coffee/*.coffee'
          ]

    concat:
      finaljs:
        dest: '../js/final.js'
        src: [
          '../js/jquery-1.10.2.js'
          '../js/bootstrap.js'          
          'temp/site.js'
        ]
        nonull: true

      finalcss:
        dest: '../css/final.css'
        src: [
          '../css/reset.css'
          '../css/bootstrap.min.css'
          '../css/font-awesome.css'
          'temp/master.css'
          ]
        nonull: true

    compass:
      dist:
        options:
          sassDir: '../sass'
          cssDir: 'temp'

    cssmin:
      minify:
        src: 'temp/final.css'
        dest: '../dest/css/final.min.css'

    uglify:
      final:
        files:
          '../js/final.min.js': ['temp/final.js']

    clean: ['temp/']
    
    watch:
      scripts:
        files: ['../**/*.coffee', '../**/*.scss', '../*.html']
        tasks: ['default']

  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jst'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'default', ['coffee', 'compass', 'concat', 'clean']
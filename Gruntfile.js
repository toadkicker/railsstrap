/** This file is a wrapper for managing front-end specific tasks in this gem where rake falls short for support **/

module.exports = function (grunt) {
    // Load grunt tasks automatically
    require('load-grunt-tasks')(grunt);

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        less_imports: {
            options: {
                banner: '//Bootstrap Additions',
                inlineCSS: true
            },
            '<%= pkg.app %>/vendor/assets/stylesheets/railsstrap.less': [
                '<%= pkg.app %>/vendor/assets/stylesheets/bootstrap-additions.less',
                '<%= pkg.app %>/vendor/assets/stylesheets/animate/animate.less',
                '<%= pkg.app %>/vendor/assets/stylesheets/animate/*.less',
                '<%= pkg.app %>/vendor/assets/stylesheets/animate/**/*.less',
                '!<%= pkg.app %>/vendor/assets/stylesheets/railsstrap.less'
            ]
        },

        less: {
            min: {
                options: {
                    compress: true
                },
                files: {
                    "<%= pkg.app %>/vendor/public/stylesheets/railsstrap/<%= pkg.version %>/datepicker.min.css": "<%= pkg.app %>/vendor/assets/stylesheets/datepicker/datepicker.less",
                    "<%= pkg.app %>/vendor/public/stylesheets/railsstrap/<%= pkg.version %>/railsstrap.min.css": "<%= pkg.app %>/vendor/assets/stylesheets/railsstrap.less"
                }
            },
            normal: {
                files: {
                    "<%= pkg.app %>/vendor/public/stylesheets/railsstrap/<%= pkg.version %>/datepicker.css": "<%= pkg.app %>/vendor/assets/stylesheets/datepicker/datepicker.less",
                    "<%= pkg.app %>/vendor/public/stylesheets/railsstrap/<%= pkg.version %>/railsstrap.css": "<%= pkg.app %>/vendor/assets/stylesheets/railsstrap.less"
                }
            }
        },
        uglify: {
            min: {
                options: {
                    compress: true
                },
                files: {
                    "<%= pkg.app %>/vendor/public/javascripts/railsstrap/<%= pkg.version %>/datepicker.min.js": [
                        "<%= pkg.app %>/vendor/assets/bower_components/moment/min/moment.min.js",
                        "<%= pkg.app %>/vendor/assets/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"
                    ]
                }
            }
        }

    });

    grunt.registerTask('default', ['less', 'uglify'])

};
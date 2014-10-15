/** This file is a wrapper for managing front-end specific tasks in this gem where rake falls short for support **/

module.exports = function(grunt) {
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
            dist: {
                files: {
                    "<%= pkg.app %>/vendor/assets/stylesheets/dist/railsstrap.css": "<%= pkg.app %>/vendor/assets/stylesheets/railsstrap.less"
                }
            }
        }
    });

};
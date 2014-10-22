gulp = require 'gulp'
addsrc = require 'gulp-add-src'
concat = require 'gulp-concat'
intercept = require 'gulp-intercept'

convert = (fn) ->
  intercept (file) ->
    return unless file.contents
    content = file.contents.toString()
    path = file.path
    result = fn content, path
    if typeof result == 'object'
      result = JSON.stringify result
    file.contents = new Buffer result
    # File extention should be changed as content changes
    file

YAML = require 'yamljs'
yml2angular = (content, path) ->
  json = YAML.parse content
  str = JSON.stringify json
  lang = path.match(/translations\/([^/]*)\//)?[1]
  return unless lang && str
  """angular.module('easyfuture.simulation')
.config(function($translateProvider) {
  $translateProvider.translations('#{lang}', #{str});
});"""

# Execute app task then concat translations to the file
gulp.task 'translations', ['app'], ->
  gulp.src 'translations/**'
  .pipe convert yml2angular
  .pipe addsrc 'www/js/easyfuture-app.js'
  .pipe concat 'easyfuture-app.js'
  .pipe gulp.dest 'www/js/'

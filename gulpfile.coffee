gulp = require 'gulp'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
notify = require 'gulp-notify'
jasmine = require 'gulp-jasmine'

handleErrors = ->
    args = Array.prototype.slice.call(arguments)
    notify.onError(title: 'Compile Error', message: '<%= error.message %>').apply(this, args)
    this.emit('end')

gulp.task 'default', ['coffee']

gulp.task 'coffee', ->
    gulp.src './src/**/*.coffee'
        .pipe coffeelint()
        .pipe coffeelint.reporter()
        .pipe coffee(bare: true).on('error', handleErrors)
        .pipe gulp.dest 'lib'

gulp.task 'test', ->
    gulp.src './spec/model.coffee'
        .pipe jasmine()
        .pipe coffeelint.reporter()

'use strict';

var gulp   = require('gulp');
var gutil  = require('gulp-util');
var wrench = require('wrench');

/*
  ==========================
  Basic Options
  ==========================
*/
var options = {
  mainAngularModule : 'iBuy'
};


/*
  ==========================
  Base build
  ==========================
*/

options.modulesData = {
  server : {
    routes : {
      '/bower_components': 'bower_components',
      '/environment'     : 'builds/dev/serve/app/project/scripts/environment'
    },
    isEnabled: true
  }
}

/*
  ==========================
  Read gulp files
  ==========================
*/
require('basebuild-angular')(options);


/*
  ==========================
  Default Task
  ==========================
*/
gulp.task('default', ['clean'], function () {
    gulp.start('build');
});

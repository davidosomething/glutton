var env = require('broccoli-env').getEnv();

var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');

var assets = 'assets';
assets = pickFiles(assets, {
  srcDir: '/',
  destDir: 'assets'
});

var app = 'app';
app = pickFiles(app, {
  srcDir: '/',
  destDir: 'app'
});

////////////////////////////////////////////////////////////////////////////////
// JavaScript
////////////////////////////////////////////////////////////////////////////////

var filterCs = require('broccoli-coffee');
var browserify = require('broccoli-browserify');
var uglifyJs = require('broccoli-uglify-js');

app = filterCs(app, {
  bare: true
});
app = browserify(app, {
  entries:    [ 'app/app.js' ],
  outputFile: 'app/app.js',
  browserify: {},
  bundle:     {},
  require:    [],
});
app = uglifyJs(app, {
  compress: true
})

////////////////////////////////////////////////////////////////////////////////
// SASS
////////////////////////////////////////////////////////////////////////////////

var compileSass = require('broccoli-ruby-sass');

var css = compileSass([ assets ], 'assets/sass/main.scss', 'assets/css/main.css', {
  outputStyle: 'compressed',
  precision:   '9'
});

////////////////////////////////////////////////////////////////////////////////
// Finalization
////////////////////////////////////////////////////////////////////////////////

module.exports = mergeTrees([ app, css ]);

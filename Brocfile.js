var env = require('broccoli-env').getEnv();

var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');

var assets = 'assets';
assets = pickFiles(assets, {
  srcDir: '/',
  destDir: 'assets'
});

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

// module.exports = mergeTrees([ app, css ]);
module.exports = css;

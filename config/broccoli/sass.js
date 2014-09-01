var env = require('broccoli-env').getEnv();

var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');
var fingerprint = require('broccoli-fingerprint');

////////////////////////////////////////////////////////////////////////////////
// SASS
////////////////////////////////////////////////////////////////////////////////
var compileSass = require('broccoli-ruby-sass');
var autoprefixer = require('broccoli-autoprefixer');
var cssOptimizer = require('broccoli-csso');

var css = compileSass([ 'assets/sass' ], 'main.scss', 'assets/css/main.css', {
  bundleExec:   true,
  outputStyle:  'compressed',
  precision:    '9',
  sourceMap:    true,
  require:      [ 'sass-json-vars' ]
});

css = autoprefixer(css);

css = cssOptimizer(css);

css = fingerprint(css);

////////////////////////////////////////////////////////////////////////////////
// Asset Manifests
////////////////////////////////////////////////////////////////////////////////

var assetManifest = fingerprint.manifest(css, { name: 'css.json' })

////////////////////////////////////////////////////////////////////////////////
// Finalization
////////////////////////////////////////////////////////////////////////////////

module.exports = mergeTrees([ css, assetManifest ]);

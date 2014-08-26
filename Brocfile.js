var env = require('broccoli-env').getEnv();

var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');
var fingerprint = require('broccoli-fingerprint');

var assets = 'assets';
assets = pickFiles(assets, {
  srcDir: '/',
  destDir: 'assets'
});

////////////////////////////////////////////////////////////////////////////////
// JSON
////////////////////////////////////////////////////////////////////////////////
var stripJsonComments = require('broccoli-strip-json-comments');
var json = pickFiles('assets/json', {
  srcDir: '/',
  destDir: 'assets/json'
});
json = stripJsonComments(json);

////////////////////////////////////////////////////////////////////////////////
// SASS
////////////////////////////////////////////////////////////////////////////////
var compileSass = require('broccoli-ruby-sass');
var autoprefixer = require('broccoli-autoprefixer');
var cssOptimizer = require('broccoli-csso');

var css = compileSass([ assets ], 'assets/sass/main.scss', 'assets/css/main.css', {
  outputStyle: 'compressed',
  precision:   '9'
});

css = autoprefixer(css);

css = cssOptimizer(css);

css = fingerprint(css);

////////////////////////////////////////////////////////////////////////////////
// Asset Manifests
////////////////////////////////////////////////////////////////////////////////

var allAssets = mergeTrees([ css, json, ]); //, images, fonts, etc.
var assetManifest = fingerprint.manifest(allAssets, { name: 'manifest.json' })

////////////////////////////////////////////////////////////////////////////////
// Finalization
////////////////////////////////////////////////////////////////////////////////

module.exports = mergeTrees([ allAssets, assetManifest ]);

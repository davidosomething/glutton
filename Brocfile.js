var env = require('broccoli-env').getEnv();

var mergeTrees = require('broccoli-merge-trees');
var pickFiles = require('broccoli-static-compiler');
var concatFilenames = require('broccoli-concat-filenames');

var fingerprint = require('broccoli-fingerprint');

var assets = 'assets';
assets = pickFiles(assets, {
  srcDir: '/',
  destDir: 'static/assets'
});

////////////////////////////////////////////////////////////////////////////////
// SASS
////////////////////////////////////////////////////////////////////////////////
var bowerComponents = 'bower_components';
var normalizeCss = pickFiles(bowerComponents, {
  srcDir:  '/normalize.css',
//  files:   ['normalize.css'],
  destDir: '/assets/sass/vendor'
});
// normalizeCss = concatFilenames(normalizeCss, {
//   inputFiles: ['normalize.css'],
//   outputFile: '_normalize.scss',
// });

var compileSass = require('broccoli-ruby-sass');
var autoprefixer = require('broccoli-autoprefixer');
var cssOptimizer = require('broccoli-csso');

var css = compileSass([ assets ], 'assets/sass/main.scss', 'css/main.css', {
  outputStyle: 'compressed',
  precision:   '9'
});

css = autoprefixer(css);

css = cssOptimizer(css);

css = fingerprint(css);

////////////////////////////////////////////////////////////////////////////////
// Asset Manifests
////////////////////////////////////////////////////////////////////////////////

var allAssets = mergeTrees([ css ]); //, images, fonts, etc.
var assetManifest = fingerprint.manifest(allAssets, { name: 'manifest.json' })

////////////////////////////////////////////////////////////////////////////////
// Finalization
////////////////////////////////////////////////////////////////////////////////

module.exports = mergeTrees([ css, assetManifest ]);

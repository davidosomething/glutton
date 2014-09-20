# glutton

> Backbone.js powered WordPress theme for DavidOSomething.com

## Status

| Service  | Status
| -------: | :--------
| Build    | [![Travis CI build status][travisBadge]][travisLink]
| Test     | [![Coverage Status][coverallsBadge]][coverallsLink] [![Code Climate][codeClimateBadge]][codeClimateLink] [![SensioLabsInsight][SensioBadge]][SensioLink] [![Scrutinizer Code Quality][scrutinizerBadge]][scrutinizerLink]
| NPM      | [![David dependency status][davidBadge]][davidLink] [![Development Dependency Status][davidDevBadge]][davidDevLink] [![Peer Dependency Status][davidPeerBadge]][davidPeerLink]
| Gems     | [![Gemnasium dependency status][gemnasiumBadge]][gemnasiumLink]

## Running Build Tasks

* Use `grunt w` instead of `grunt watch` so the phantomJS server can start
  first.

## Paths

### Working

Edit files in these paths

- `.travis/` - travis VM config (WIP)
- `assets/` - SASS, webfonts, images, etc. pre-asset-pipeline
- `app/` - Backbone app coffee
  - `c/` - Collections
  - `m/` - Models
  - `p/` - Plugins
  - `r/` - Router
  - `u/` - Modules (e.g., design patterns: Adapters, Mediators, .etc.)
  - `v/` - Views
  - `x/` - Mixins
- `config/` - Grunt tasks, Karma config, tooling
- `templates/` - Mustache templates
- `test/` - test fixtures, shims, etc
  - `app/` - unit tests for the backbone-coffee app
  - `e2e/` - end-to-end/integration tests using phantomJS/selenium+webdriver
  - `php/` - phpunit tests

### Generated

Task runner will generate files into these paths

- `docs/` - app documentation
- `reports/` - app reports, code coverage
- `static/` - compiled/optimized assets
  - `app/` - JS and sourcemaps
    - `app.js` - Application bundle
    - `lib.js` - Libraries, plugins bundle
  - `assets/` - CSS and sourcemaps, images, other assets

### Managed

Managed by package managers and tmp folders

- `bower_components/`, versioned
- `node_modules/`
- `tmp/` - broccoli cache, grunt cleaned
- `temp/` - browserify cache, grunt cleaned
- `.sass-cache/` - sass cache, grunt cleaned

## Other badges and stuff

| Service      | Status
| -----------: | :--------
| Codeship     | [![Codeship Status for davidosomething/glutton][codeshipBadge]][codeshipLink]
| Code Climate | [![Code Climate Coverage][codeClimateCoverageBadge]][codeClimateLink]
| drone.io     | [![Build Status][droneIoBadge]][droneIoLink]
| Semaphore    | [![Build Status][semaphoreBadge]][semaphoreLink]
| Circle CI    | [![Circle CI][circleCIBadge]][circleCILink]


----

[circleCIBadge]:    https://circleci.com/gh/davidosomething/glutton/tree/master.png?style=badge
[circleCILink]:     https://circleci.com/gh/davidosomething/glutton/tree/master
[codeClimateBadge]: https://codeclimate.com/github/davidosomething/glutton/badges/gpa.svg
[codeClimateLink]:  https://codeclimate.com/github/davidosomething/glutton
[codeClimateCoverageBadge]: https://codeclimate.com/github/davidosomething/glutton/badges/coverage.svg
[codeshipBadge]:    https://www.codeship.io/projects/4c4f8010-0f00-0132-fc79-02c0648a600f/status?branch=master
[codeshipLink]:     https://www.codeship.io/projects/32535
[coverallsBadge]:   https://coveralls.io/repos/davidosomething/glutton/badge.png
[coverallsLink]:    https://coveralls.io/r/davidosomething/glutton
[davidBadge]:       https://david-dm.org/davidosomething/glutton.png?theme=shields.io
[davidLink]:        https://david-dm.org/davidosomething/glutton#info=dependencies
[davidDevBadge]:    https://david-dm.org/davidosomething/glutton/dev-status.png?theme=shields.io
[davidDevLink]:     https://david-dm.org/davidosomething/glutton#info=devDependencies
[davidPeerBadge]:   https://david-dm.org/davidosomething/glutton/peer-status.png?theme=shields.io
[davidPeerLink]:    https://david-dm.org/davidosomething/glutton#info=peerDependencies
[droneIoBadge]:     https://drone.io/github.com/davidosomething/glutton/status.png
[droneIoLink]:      https://drone.io/github.com/davidosomething/glutton/latest
[gemnasiumBadge]:   http://img.shields.io/gemnasium/davidosomething/glutton.svg
[gemnasiumLink]:    https://gemnasium.com/davidosomething/glutton
[scrutinizerBadge]: https://scrutinizer-ci.com/g/davidosomething/glutton/badges/quality-score.png?b=master
[scrutinizerLink]:  https://scrutinizer-ci.com/g/davidosomething/glutton/?branch=master
[semaphoreBadge]:   https://semaphoreapp.com/api/v1/projects/b987bb51-e328-4052-a870-f83c3b7acd4d/242696/shields_badge.png
[semaphoreLink]:    https://semaphoreapp.com/davidosomething/glutton
[sensioLink]:       https://insight.sensiolabs.com/projects/af473c0e-78c7-4117-8721-63ccd72e95c1
[sensioBadge]:      https://insight.sensiolabs.com/projects/af473c0e-78c7-4117-8721-63ccd72e95c1/mini.png
[travisLink]:       https://travis-ci.org/davidosomething/glutton
[travisBadge]:      https://travis-ci.org/davidosomething/glutton.svg?branch=master

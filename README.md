# glutton

> Backbone.js powered WordPress theme for DavidOSomething.com

## Status

| Service  | Status
| -------: | :--------
| Build    | [![Travis CI build status][travisBadge]][travisLink]
| Test     | [![Coverage Status][coverallsBadge]][coverallsLink] [![Code Climate][codeClimateBadge]][codeClimateLink]
| NPM      | [![David dependency status][davidBadge]][davidLink] [![Development Dependency Status][davidDevBadge]][davidDevLink]
| Gems     | [![Gemnasium dependency status][gemnasiumBadge]][gemnasiumLink]

## Paths

### Working

Edit files in these paths

- `.travis/` - travis VM config
- `assets/` - test fixtures, shims, etc
- `app/` - app coffee
- `templates/` - Mustache templates
- `test/` - test fixtures, shims, etc
  - `app/` - tests for the backbone-coffee app
  - `e2e/` - end-to-end tests using selenium/webdriver
  - `php/` - phpunit tests

### Generated

Task runner will generate files into these paths

- `docs/` - app documentation
- `reports/` - app reports, code coverage
- `static/` - compiled/optimized assets

### Managed

Managed by package managers and tmp folders

- `bower_components/`
- `node_modules/`
- `tmp/` - broccoli cache
- `.sass-cache/` - sass cache

## Other badges and stuff

| Service      | Status
| -----------: | :--------
| Codeship     | [![Codeship Status for davidosomething/glutton][codeshipBadge]][codeshipLink]<br>
| Code Climate | [![Code Climate Coverage][codeClimateCoverageBadge]][codeClimateLink]<br>
| drone.io     | [![Build Status][droneIoBadge]][droneIoLink]<br>
| Semaphore    | [![Build Status][semaphoreBadge]][semaphoreLink]<br>

----


[codeClimateBadge]: https://codeclimate.com/github/davidosomething/glutton/badges/gpa.svg
[codeClimateLink]:  https://codeclimate.com/github/davidosomething/glutton
[codeClimateCoverageBadge]: https://codeclimate.com/github/davidosomething/glutton/badges/coverage.svg
[codeshipBadge]:  https://www.codeship.io/projects/4c4f8010-0f00-0132-fc79-02c0648a600f/status?branch=master
[codeshipLink]:   https://www.codeship.io/projects/32535
[coverallsBadge]: https://coveralls.io/repos/davidosomething/glutton/badge.png
[coverallsLink]:  https://coveralls.io/r/davidosomething/glutton
[davidBadge]:     https://david-dm.org/davidosomething/glutton.png?theme=shields.io
[davidLink]:      https://david-dm.org/davidosomething/glutton#info=dependencies
[davidDevBadge]:  https://david-dm.org/davidosomething/glutton/dev-status.png?theme=shields.io
[davidDevLink]:   https://david-dm.org/davidosomething/glutton#info=devDependencies
[droneIoBadge]:   https://drone.io/github.com/davidosomething/glutton/status.png
[droneIoLink]:    https://drone.io/github.com/davidosomething/glutton/latest
[gemnasiumBadge]: http://img.shields.io/gemnasium/davidosomething/glutton.svg
[gemnasiumLink]:  https://gemnasium.com/davidosomething/glutton
[semaphoreBadge]: https://semaphoreapp.com/api/v1/projects/b987bb51-e328-4052-a870-f83c3b7acd4d/242696/shields_badge.png
[semaphoreLink]:  https://semaphoreapp.com/davidosomething/glutton
[travisLink]:     https://travis-ci.org/davidosomething/glutton
[travisBadge]:    https://travis-ci.org/davidosomething/glutton.svg?branch=master


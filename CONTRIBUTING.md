# Contributing

- Use an editor with EditorConfig support - http://editorconfig.org/
- Install build tools via NPM, Bundler, Composer
- All CLI operations are done through the `grunt` task runner
- Vendor sass uses `bower install`, `grunt bower`, `grunt copy`
  - See `bower_components`, `assets/bower`, and `assets/sass/vendor`
- App JS uses browserify, CommonJS
- Unit tests are written using PHPUnit and Mocha/Chai/Sinon/Proxyrequirify
  - See `test/app`
- Integration tests are written in BDD using Chai, Mocha, and CasperJS
  - See `test/e2e`

# HTML

- Write in BEM methodology

# CSS

- Written in SCSS
- Documented in SassDoc
- Only use classes to style
- Write in BEM methodology
- Follow rules in `main.scss`, and atomic design principles
- Use classes for responsive styling, see `breakpoints.json`
  - Only use media queries for tweaking within the class block, e.g. a specific
    pixel tweak for iPhone
- Name patterns following documented ones defined on http://patterntap.org
  - The final word in a filename should be a noun
  - The initial word of an organism or molecule filename should be the thing
    it is made of most.

# JavaScript



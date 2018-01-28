# Bootstrap 4 on Steroids + FontAwesome 5 for Rails 3.1 and up

**Custom UI Components + CSS Animations + ActionView Integrated Bootstrap templating**

[![Gem Version](https://badge.fury.io/rb/railsstrap.svg)](http://badge.fury.io/rb/railsstrap)
[![Build Status](https://travis-ci.org/toadkicker/railsstrap.svg?branch=current)](https://travis-ci.org/toadkicker/railsstrap)
[![Coverage Status](https://img.shields.io/coveralls/toadkicker/railsstrap.svg)](https://coveralls.io/r/toadkicker/railsstrap?branch=master)

## Quickstart
```
Gemfile:
gem 'railsstrap'

bundle install

rails generate railsstrap:layout
rails generate scaffold bar sprocket:string quanity:integer (etc..)

*Optional*
bundle exec rails g railsstrap:install *inserts railsstrap into css/js files in rails, configures assets.rb*
```


Railsstrap outputs Bootstrap compliant HTML in the standard rails scaffolding tool.
Layouts use CDN versions of jQuery, Bootstrap, and Font Awesome by default.

## Precompiled CSS/JS

You can also add the precompiled assets to webpacker or the asset pipeline. Here's the webpack output:

### Library size (compiled all assets for production)
|                             Asset |     Size |  Chunks |           Chunk Names |
|-----------------------------------|----------|---------|-----------------------|
|                  railsstrap.min.js  |   241 kB |     0   | [emitted]  railsstrap |
|   ../stylesheets/railsstrap.min.css |   193 kB |     0   | [emitted]  railsstrap |
|../stylesheets/railsstrap.min.css.gz |  25.7 kB |         | [emitted]             |
|                railsstrap.min.js.gz |  69.9 kB |         | [emitted]             |


To use these files simply add '.min' to the end of railsstrap's import statements in the asset pipeline. 
You likely will want to import animations and components individually to keep the bundle even smaller, as well as set SASS variables to your liking.
All SASS files are available for import in the asset pipeline or webpacker.

## Helpers & Bootstrap Additions
* [Asides](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#aside) - A modal that slides in from the left or right. Used often in mobile apps for off-screen sidebars or overlays.
* Alert Box Helper placements and sizes
* Badges
* Breadcrumbs Helper
* [Callouts](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#callout) - Similar to an alert, it is used for drawing attention to content.
* [Date & Time picker](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#datepicker--timepicker) - A styled HTML5 datepicker.
* Flash Helper (displays bootstrap styled flash messages with the alert helper)
* Form Errors Helper
* Icon Helper
* Modal Helper & [Modal enhancements](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#modal) - animations and real centering placement.
* [Popover enhancements](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#popover) - animations and custom placements for popover arrows and locations.
* [Tooltip](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#tooltip) - animations and custom placements for tooltip arrows and locations.
* Navbar
* Progress Bar Helper
* Button Helper
* Card Helper
* Dropdown Helper
* CDN Helper (Default host is cdnjs.cloudflare.com)

### Animations

Railsstrap comes with over 75 CSS animations. See the wiki or the [vendor/assets/stylesheets/animate](https://github.com/toadkicker/railsstrap/tree/master/vendor/assets/stylesheets/animate) folder for more info.

The `animate` CSS class controls runs an animation for 1 second. Append `slideLeft` for an element to move to the left. Animation classes can be combined for interesting effects.

### Icon helper
Railsstrap includes an `icon` helper defaulted with Font Awesome 4. The icon helper can use any library and icon you want.
 
Only the pro version of Font Awesome 5 requires additional configuration. Railsstrap JS ships with the latest Font Awesome component.

```
icon(:share_alt)
# => <i class="far far-share-alt"></i>
icon(:lock, :white)
# => <i class="far far-lock fa-white"></i>
icon(:thumbs_up, :fas)
# => <i class="fas fas-thumbs-up"></i>
icon(:lock, library: :far, tag: :span)
# => <span class="far far-lock"></span>
```

Railsstrap does *not* bundle every icon in the library. It would just be too large to do that. 
FontAwesome uses the i2svg conversion method to replace any <i></i> tags with FontAwesome SVG.
To enable this in Railsstrap, there are three things to do:
* set `$font-awesome-flash-pending: true` in your SASS bundle
* add `@import fontawesome` to your application.scss file
* add `class="fontawesome-i2svg-pending"` to the `<html>` tag

If you disable FontAwesome, you will also want to remove the i2svg-pending class from the <html> tag in your layout or the <body> will not display.


## Building the gem

The gem is organized by ruby specific tasks, and front-end specific tasks. `bundle exec rake` will attempt to run the suite of build commands, but you need a few dependencies that are outside of bundler/rubygems's domain.

Compiled and minified versions of all SASS/JS files are done using Webpack configuration and Yarn. The default configuration favors CDN for less friction to get started.


## Contributing
Railsstrap uses rspec for testing, and all essential ruby code is covered by tests. That doesn't mean it is bug free, but
tests are always appreciated with pull requests.

## About Me
[toadkicker.com](http://toadkicker.com)


## Thanks
Bootstrap, FontAwesome, and all railsstrap contributors
http://twbs.github.io/bootstrap

Railsstrap is licensed under [MIT](https://github.com/toadkicker/railsstrap/LICENSE.md)


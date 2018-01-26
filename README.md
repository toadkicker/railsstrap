# Bootstrap 4 on Steroids + FontAwesome 5 for Rails 3.1 and up

**Custom UI Components + CSS Animations + ActionView Integrated Bootstrap templating**

[![Gem Version](https://badge.fury.io/rb/railsstrap.svg)](http://badge.fury.io/rb/railsstrap)
[![Build Status](https://travis-ci.org/toadkicker/railsstrap.svg?branch=master)](https://travis-ci.org/toadkicker/railsstrap)
[![Coverage Status](https://img.shields.io/coveralls/toadkicker/railsstrap.svg)](https://coveralls.io/r/toadkicker/railsstrap?branch=master)

## Why is your gem different?

Railsstrap fills the gap where the offical bootstrap gem only provides the assets needed. 
You can mix and import SASS with sprockets or webpack.
It includes helpers, exotic placements, animations, and other component enhancements 
not included in the official bootstrap release. It also outputs Bootstrap compliant HTML and additional javascript 
components. All of the CSS is exposed to developers to customize using SASS, Yarn, Webpack, and all the 
modern development tools you would expect with supercharged ActionView powered templating.

## Library size (compiled all assets for production)
|                             Asset |     Size |  Chunks |           Chunk Names |
|-----------------------------------|----------|---------|-----------------------|
|                  railsstrap.min.js  |   241 kB |     0   | [emitted]  railsstrap |
|   ../stylesheets/railsstrap.min.css |   193 kB |     0   | [emitted]  railsstrap |
|../stylesheets/railsstrap.min.css.gz |  25.7 kB |         | [emitted]             |
|                railsstrap.min.js.gz |  69.9 kB |         | [emitted]             |

##Bootstrap additions

###Custom Components
* [Asides](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#aside) - A modal that slides in from the left or right. Used often in mobile apps for off-screen sidebars or overlays.
* Badges
* Flash Helper
* Date Picker
* Navbar
* Ajax-enabled breadcrumbs helper
* Form errors are automatically styled
* [Callouts](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#callout) - Similar to an alert, it is used for drawing attention to content.
* [Date & Time picker](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#datepicker--timepicker) - A styled HTML5 datepicker.
* [Modal enhancements](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#modal) - animations and real centering placement.
* [Popover enhancements](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#popover) - animations and custom placements for popover arrows and locations.
* [Tooltip](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#tooltip) - animations and custom placements for tooltip arrows and locations.


###Animations

Railsstrap comes with over 75 CSS animations. See the wiki or the [vendor/assets/stylesheets/animate](https://github.com/toadkicker/railsstrap/tree/master/vendor/assets/stylesheets/animate) folder for more info. Also the wiki has detailed instructions on using them.

### Font Awesome 5 Icon helper
Railsstrap includes an `icon` helper compatible with Font Awesome 5 free and pro versions. 
Only the pro version requires additional configuration. Railsstrap ships with the latest Font Awesome free and brand icon libraries.

```
icon(:share_alt)
# => <i class="far fa-share-alt"></i>
icon(:lock, :white)
# => <i class="far fa-lock fa-white"></i>
icon(:thumbs_up, :fas)
# => <i class="fas fa-thumbs-up"></i>
icon(:lock, library: :far, tag: :span)
# => <span class="far fa-lock"></span>
```

Railsstrap does *not* bundle every icon in the library. It would just be too large to do that. 
It uses the i2svg conversion method to replace any <i></i> tags with FontAwesome SVG. 
If you disable FontAwesome, you will also want to remove the i2svg-pending class from the <html> tag in your layout or the <body> will not display.
   
To configure the pro version, create an `.npmrc` file, inserting:

```
@fortawesome:registry=https://npm.fontawesome.com/MY_PRO_KEY_GOES_HERE
```

And then install the pro icons with yarn/npm.

## Quick install
Open your Gemfile, and add the gem to your list of dependencies.

```
gem railsstrap
```

Then *optionally* run the installer

```
bundle install
bundle exec rails g railsstrap:install
```

This will insert the appropriate entries into your application.js and application.css files, as well as configure rails asset pipeline. 

It will also provide you with the ability to customize Bootstrap and FontAwesome to your liking.

Most of the info you'll need is in the [wiki](https://github.com/toadkicker/railsstrap/wiki/Installing), and if it isn't please contribute!

## Building the gem

The gem is organized by ruby specific tasks, and front-end specific tasks. `bundle exec rake` will attempt to run the suite of build commands, but you need a few dependencies that are outside of bundler/rubygems's domain.

Compiled and minified versions of Fontawesome and Bootstrap JS/CSS are done using Webpack configuration. 
Railsstrap reccomends using this file in your front end, either imported separately in a `javascript_script_tag` or in the application.js `require railsstrap` statements.


## Contributing
Railsstrap uses rspec for testing, and all essential ruby code is covered by tests. That doesn't mean it is bug free, but
tests are always appreciated with pull requests.

## About Me
[toadkicker.com](http://toadkicker.com)


## Thanks
Bootstrap, FontAwesome, and all railsstrap contributors
http://twbs.github.io/bootstrap

Railsstrap is licensed under [MIT](https://github.com/toadkicker/railsstrap/LICENSE.md)


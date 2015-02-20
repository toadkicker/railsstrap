# Bootstrap + FontAwesome for Rails v3.1 & v4 Asset Pipeline

[![Bower version](https://badge.fury.io/bo/bootstrap.svg)](http://badge.fury.io/bo/bootstrap)
[![Gem Version](https://badge.fury.io/rb/railsstrap.svg)](http://badge.fury.io/rb/railsstrap)
[![Build Status](https://travis-ci.org/toadkicker/railsstrap.svg?branch=v3.2.0.1)](https://travis-ci.org/toadkicker/railsstrap)
[![Coverage Status](https://img.shields.io/coveralls/toadkicker/railsstrap.svg)](https://coveralls.io/r/toadkicker/railsstrap?branch=develop)

railsstrap integrates Bootstrap and FontAwesome for Rails Asset Pipeline (Rails 4, 3.1, 3.2 are supported). It was born and extended from twitter-bootstrap-rails.

## Why is your gem different?

Railsstrap is more than just another gem providing bootstrap and fontawesome for Rails apps. It includes Bootstrap additions that include exotic placements, animations, and other component enhancements not included in the official bootstrap release. It also includes many HTML helpers and additional javascript components. All of this is exposed to UI developers to customize to their liking using either LESS and Coffeescript, or plain CSS and Javascript.

How to try it in your browser
=============================

The `examples` folder includes three sample apps that you can rapidly run in
your browser and edit as you please, in order to visually appreciate the result
of Railsstrap.

If you’d like to run the _test Rails app_:

1. Download the source code
1. `cd` into the `examples/rails` folder
1. Run `bundle install`
1. Run `bundle exec rails server`
1. Point your browser to [http://0.0.0.0:3000](http://0.0.0.0:3000)

If you prefer to see the helpers inside a _test Middleman app_:

1. Download the source code
1. `cd` into the `examples/middleman` folder
1. Run `bundle install`
1. Run `bundle exec middleman`
1. Point your browser to [http://0.0.0.0:4567](http://0.0.0.0:4567)

If you prefer to see the helpers inside a _test Padrino app_:

1. Download the source code
1. `cd` into the `examples/padrino` folder
1. Run `bundle install`
1. Run `bundle padrino start`
1. Point your browser to [http://0.0.0.0:3000](http://0.0.0.0:3000)

##Bootstrap additions

###Custom Components
* [Asides](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#aside) - A modal that slides in from the left or right. Used often in mobile apps for off-screen sidebars or overlays. - New in 3.3.2!
* [Callouts](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#callout) - Similar to an alert, it is used for drawing attention to content. - New in 3.3.0!
* [Date & Time picker](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#datepicker--timepicker) - A styled HTML5 datepicker. - New in 3.3.1!
* [Modal enhancements](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#modal) - animations and real centering placement.
* [Popover enhancements](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#popover) - animations and custom placements for popover arrows and locations.
* [Tooltip](https://github.com/toadkicker/railsstrap/wiki/Bootstrap-Additions#tooltip) - animations and custom placements for tooltip arrows and locations.

### Animations

Railsstrap comes with over 75 CSS animations. See the wiki or the [vendor/assets/stylesheets/animate](https://github.com/toadkicker/railsstrap/tree/develop/vendor/assets/stylesheets/animate) folder for more info. Also the wiki has detailed instructions on using them.

## Quick rails install
Open your Gemfile, and add the gem to your list of dependencies.

```
gem less-rails
gem railsstrap
```

Then run the installer

```
bundle install
bundle exec rails g railsstrap:install
```

This will insert the appropriate entries into your application.js and application.css files, as well as configure rails asset pipeline. It will also provide you with the ability to customize Bootstrap and FontAwesome to your liking.

Most of the info you'll need is in the [wiki](https://github.com/toadkicker/railsstrap/wiki/Installing), and if it isn't please contribute!

## Building the gem

The gem is organized by ruby specific tasks, and front-end specific tasks. `bundle exec rake` will attempt to run the suite of build commands, but you need a few dependencies that are outside of bundler/rubygems's domain.

For compiling stylesheets and javascripts, the gem uses Gruntjs. You'll need node/npm installed to compile them manually. *You do not need to use grunt if you are just referencing specific less/js/coffee files in your rails app*

## Contributions


## About Me
[toadkicker.com](http://toadkicker.com)


## Thanks
Bootstrap, FontAwesome, and all railsstrap contributors
http://twbs.github.io/bootstrap


## License
Copyright (c) 2014 Todd Baur

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Bootstrap 3.2.1 for Rails 4 Asset Pipeline

[![Gem Version](https://badge.fury.io/rb/railsstrap.svg)](http://badge.fury.io/rb/railsstrap)
[![Build Status](https://travis-ci.org/toadkicker/railsstrap.svg?branch=v3.2.0.1)](https://travis-ci.org/toadkicker/railsstrap)
[![Coverage Status](https://img.shields.io/coveralls/toadkicker/railsstrap.svg)](https://coveralls.io/r/toadkicker/railsstrap)

Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites. It includes base CSS and HTML for typography, forms, buttons, tables, grids, navigation, and more.

railsstrap integrates Bootstrap CSS toolkit for Rails Asset Pipeline (Rails 4, 3.1, 3.2 are supported). It was born and extended from twitter-bootstrap-rails, but several non-bootstrap helpers and UI improvements from the Bootstrap community.

## Example Application
An example application is available at [toadkicker/teststrap](https://github.com/toadkicker/teststrap). You can view it running on heroku [here.](http://teststrap.herokuapp.com/) Contributions welcome.

## Quick install
Open your Gemfile, and add the gem to your list of dependencies.

```gem railsstrap```

Then run the installer

```
bundle install
bundle exec rails g railsstrap:install
```

This will insert the appropriate entries into your application.js and application.css files. It will also provide you with the ability to customize Bootstrap to your liking.

Most of the info you'll need is in the wiki, and if it isn't please contribute!

## Many thanks to the twitter-bootstrap-rails contributors, who made this fork possible:
<ul>
  <li>Seyhun Akyürek</li>
  <li>Ben Lovell</li>
  <li>Daniel Morris</li>
  <li>Bradly Feeley</li>
  <li>Guilherme Moreira</li>
  <li>Alex Behar</li>
  <li>Brandon Keene</li>
  <li>Anthony Corcutt</li>
  <li>Colin Warren</li>
  <li>Giovanni Cappellotto</li>
  <li>Masakuni Kato</li>
  <li>Gudleik Rasch</li>
  <li>Thomas Volkmar Worm</li>
  <li>Thiago Almeida</li>
  <li>Sébastien Grosjean</li>
  <li>Nick DeSteffen</li>
  <li>Christian Joudrey</li>
  <li>Leonid Shevtsov</li>
</ul>

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

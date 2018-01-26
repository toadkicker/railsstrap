const path = require('path');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CompressionPlugin = require('compression-webpack-plugin');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

const webpack = require('webpack');

const css_output_file = 'railsstrap.min.css';
const css_output_path = path.join(__dirname, 'vendor/assets/stylesheets/');

const js_output_file = 'railsstrap.min.js';
const js_output_path = path.join(__dirname, 'vendor/assets/javascripts/');

const extractPlugin = new ExtractTextPlugin({
  filename: `../stylesheets/${css_output_file}`
});


const config = {
  entry: {
    railsstrap: './build.js'
  },
  output: {
    filename: js_output_file,
    // Output path using nodeJs path module
    path: path.resolve(js_output_path)
  },
  module: {
    rules: [

      //babel-loader
      {
        test: /\.js$/,
        include: /src/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ['env']
          }
        }
      },
      //sass-loader
      {
        test: /\.scss$/,
        include: [css_output_path],
        use: extractPlugin.extract({
          use: [
            {
              loader: 'css-loader',
              options: {
                sourceMap: true
              }
            },
            {
              loader: 'sass-loader',
              options: {
                sourceMap: true
              }
            }
          ],
          fallback: 'style-loader'
        })
      }

    ]
  },
  plugins: [
    new CleanWebpackPlugin([
      js_output_path + js_output_file,
      css_output_path + css_output_file
    ]),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery",
      Tether: "tether",
      "window.Tether": "tether",
      Alert: "exports-loader?Alert!bootstrap/js/dist/alert",
      Button: "exports-loader?Button!bootstrap/js/dist/button",
      Carousel: "exports-loader?Carousel!bootstrap/js/dist/carousel",
      Collapse: "exports-loader?Collapse!bootstrap/js/dist/collapse",
      Dropdown: "exports-loader?Dropdown!bootstrap/js/dist/dropdown",
      Modal: "exports-loader?Modal!bootstrap/js/dist/modal",
      Popover: "exports-loader?Popover!bootstrap/js/dist/popover",
      Scrollspy: "exports-loader?Scrollspy!bootstrap/js/dist/scrollspy",
      Tab: "exports-loader?Tab!bootstrap/js/dist/tab",
      Tooltip: "exports-loader?Tooltip!bootstrap/js/dist/tooltip",
      Util: "exports-loader?Util!bootstrap/js/dist/util",
      FontAwesome: 'exports-loader?FontAwesome!@fortawesome/fontawesome'
    }),
    new UglifyJSPlugin(),
    new CompressionPlugin(),
    extractPlugin
  ]
};

module.exports = config;

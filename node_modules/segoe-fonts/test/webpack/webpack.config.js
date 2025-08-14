var webpack = require('webpack');
var path = require('path');

module.exports = {
    debug: true,
    devtool: 'source-map',
    noInfo: true,
    target: 'web',
    entry: path.resolve(__dirname, 'index'),
    output: {
        path: path.resolve(__dirname, 'dist'),
        publicPath: '/',
        filename: 'bundle.js'
    },
    module: {
        loaders: [
            {test: /\.eot(\?v=\d+.\d+.\d+)?$/, loader: 'url?name=./fonts/[name].[ext]'},
            {test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url?limit=10000&mimetype=application/font-woff&name=./fonts/[name].[ext]"},
            {test: /\.svg(\?v=\d+.\d+.\d+)?$/, loader: 'url?limit=10000&mimetype=image/svg+xml&name=./fonts/[name].[ext]'},
            {test: /\.css$/, loader: 'style-loader!css-loader'}
        ]
    }
};

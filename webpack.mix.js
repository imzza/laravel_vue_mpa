const path = require('path')
const fs = require('fs-extra')
const mix = require('laravel-mix')

mix.js('resources/js/app.js', './public/dist/js')
    .js('resources/js/vendor.js', './public/dist/js')
    .sass('resources/sass/app.scss', './public/dist/css')
    .sass('resources/sass/style.scss', './public/dist/css')

mix.setPublicPath('./')
mix.setResourceRoot('/laravel_vue_mpa/');

mix.webpackConfig({
    plugins: [
        // new BundleAnalyzerPlugin()
    ],
    resolve: {
        extensions: ['.js', '.json', '.vue'],
        alias: {
            '~': path.join(__dirname, './resources/js'),
        },
    },
    output: {
        publicPath: '/laravel_vue_mpa/',
        filename: '[name].js',
        chunkFilename: 'public/dist/js/[name].[chunkhash].js',
    },
})


if (mix.inProduction()) {
    mix.version()
} else {
    mix.sourceMaps()
}

mix.then(() => {
    if (!mix.config.hmr) {
        process.nextTick(() => publishAseets())
    }
})

function publishAseets() {
    fs.removeSync('./public/mix-manifest.json')
    fs.copySync('./mix-manifest.json', './public/mix-manifest.json')
    fs.removeSync('./mix-manifest.json')
}

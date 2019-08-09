const path = require('path');
const fs = require('fs-extra');
const mix = require('laravel-mix');
require('laravel-mix-versionhash')


mix.js('resources/js/app.js', './public/dist/js')
    .js('resources/js/vendor.js', './public/dist/js')
    .sass('resources/sass/app.scss', './public/dist/css');

mix.setPublicPath('./');

//Use
// mix.babelConfig({
//   presets: ['@babel/preset-env'],
//   plugins: ['@babel/plugin-syntax-dynamic-import'],
// });


// mix.options({
//     postCss: [
//         require('autoprefixer')(),
//         *
//          * Automatically create rtl css
//          * applies styles based on the 'dir' attribute on <html></html>
//          * eg: <html dir="ltr"></html>
//          * experimental, broken

//         // require('postcss-rtl')()
//     ]
// })


// mix.extract(['vue']);

 // mix.setResourceRoot('/FormulaWeb/public/')

// // const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer')

// // mix.manifest.path = function() { return path.join(__dirname,''); };

//  mix.setPublicPath('./')

// mix
//   .js('resources/js/app.js', 'public/dist/js')
//   // .extract(['vue', 'axios'])
//   .sass('resources/sass/app.scss', 'public/dist/css')
//   // .disableNotifications()


if (mix.inProduction()) {
  mix.version();
    // .extract() // Disabled until resolved: https://github.com/JeffreyWay/laravel-mix/issues/1889
    // .version() // Use `laravel-mix-versionhash` for the generating correct Laravel Mix manifest file.
    // .versionHash()
} else {
  mix.sourceMaps();
}

// //dev Issue
// mix.options({ processCssUrls: false });

mix.webpackConfig({
  plugins: [
    // new BundleAnalyzerPlugin()
  ],
  resolve: {
    extensions: ['.js', '.json', '.vue'],
    alias: {
      '~': path.join(__dirname, './resources/js')
    }
  },
  output: {
    publicPath:'/mpa_kit/',
    // chunkFilename: mix.inProduction() ? 'js/chunks/[name].[chunkhash].js' : 'js/chunks/[name].js'
    // filename: 'public/dist/js/[name].js',
    chunkFilename: 'public/dist/js/[name].[chunkhash].js',

    // filename: '[name].js',
    // chunkFilename: 'public/dist/js/[name].[chunkhash].js',
    // path: mix.config.hmr ? '/' : path.resolve(__dirname, './public/dist')
  }
})

mix.then(() => {
  if (!mix.config.hmr) {
    process.nextTick(() => publishAseets())
  }
})

function publishAseets () {
  // const publicDir = path.resolve(__dirname, 'public')

  // if (mix.inProduction()) {
  //   fs.removeSync(path.join(publicDir, 'dist'))
  // }

    fs.removeSync('./public/mix-manifest.json');
    fs.copySync('./mix-manifest.json', './public/mix-manifest.json');
    fs.removeSync('./mix-manifest.json');

  // fs.copySync(path.join(publicDir, 'build'), path.join(publicDir, 'dist'))
  // fs.removeSync(path.join(publicDir, 'build'))
}


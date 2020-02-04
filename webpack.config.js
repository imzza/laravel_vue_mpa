const fs = require('fs');
const path = require('path');
const webpack = require('webpack');
const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');
const WebpackNotifierPlugin = require('webpack-notifier');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const TerserPlugin = require('terser-webpack-plugin');
const VueLoaderPlugin = require('vue-loader/lib/plugin');


const EventHooksPlugin = require('event-hooks-webpack-plugin');

module.exports = (env) => {
    const isDevelopment = process.env.NODE_ENV === 'development';
    const devtool = isDevelopment ? "inline-source-map" : "source-map";
    const optimization = {
        minimizer: [
            new OptimizeCssAssetsPlugin({
                cssProcessorOptions: {
                    map: {
                        inline: false
                    },
                    preset: ['default', { discardComments: { removeAll: true } }],
                }
            }),
            new TerserPlugin({
                cache: true,
                parallel: true,
                sourceMap: true,
                terserOptions: {
                    compress: {
                        warnings: false
                    },
                    output: {
                        comments: false
                    }
                }
            }),
            new HtmlWebpackPlugin({
                template: 'src/app/index.html',
                minify: {
                    removeAttributeQuotes: true,
                    collapseWhitespace: true,
                    removeComments: true
                }
            })
        ],
        minimize: true,
        splitChunks: {
            chunks: 'async',
            minSize: 30000,
            maxSize: 0,
            minChunks: 1,
            maxAsyncRequests: 6,
            maxInitialRequests: 4,
            automaticNameDelimiter: '~',
            automaticNameMaxLength: 30,
            cacheGroups: {
                defaultVendors: {
                    test: /[\\/]node_modules[\\/]/,
                    priority: -10
                },
                default: {
                    minChunks: 4,
                    priority: -20,
                    reuseExistingChunk: true
                },




                // styles: {
                //     name: 'styles',
                //     test: /\.css$/,
                //     chunks: 'all',
                //     enforce: true,
                // },



            }
        }
    }

    let rules = [{
            test: /\.html$/,
            use: ['html-loader']
        },
        {
            test: /(\.(png|jpe?g|gif|webp)$|^((?!font).)*\.svg$)/,
            use: [{
                    loader: 'url-loader',
                    options: {
                        outputPath: 'imgs',
                        // publicPath: '/',
                        limit: 8192,
                        quality: 85,
                        name: '[name].[hash].[ext]',
                        fallback: 'file-loader',
                        // useRelativePath: 'true',
                    },
                },

                {
                    loader: 'img-loader',
                    options: {
                        plugins: [
                            require('imagemin-mozjpeg')(),
                            require('imagemin-pngquant')(),
                            require('imagemin-gifsicle')(),
                            require('imagemin-svgo')(),
                        ],
                    },
                },
            ],
        },
        {
            test: /(\.(woff2?|ttf|eot|otf)$|font.*\.svg$)/,
            use: [{
                loader: 'file-loader',
                options: {
                    name: '[name].[hash].[ext]',
                    outputPath: 'fonts/'
                }
            }]
        },
        {
            test: /\.(sa|sc|c)ss$/,
            use: [
                isDevelopment ? 'vue-style-loader' : MiniCssExtractPlugin.loader,
                'css-loader',
                {
                    loader: 'postcss-loader',
                    options: {
                        plugins: function() {
                            return [
                                require('postcss-preset-env'),
                                require('postcss-custom-selectors'),
                                require('postcss-color-function'),
                                require('precss'),
                                require('autoprefixer')
                            ]
                        }
                    }
                },
                {
                    loader: 'resolve-url-loader',
                    options: {}
                },
                {
                    loader: 'sass-loader',
                    // options: {
                    //     indentWidth: 4,
                    //     // includePaths: ['absolute/path/a', 'absolute/path/b'],
                    //     sourceMap: true,
                    //     outputStyle: 'expanded',
                    // },
                },
            ]
        },

        {
            test: /\.(js|jsx)$/,
            exclude: '/(node_modules)/',
            use: {
                loader: 'babel-loader'
                // options: {
                //   presets: ['@babel/preset-env']
                // }
            }
        },
        // {
        //   test: /\.tsx?$/,
        //   use: 'ts-loader',
        //   exclude: /node_modules/
        // },
        {
            test: /\.vue$/,
            loader: 'vue-loader'
        }
    ];

    let plugins = [new webpack.ProgressPlugin(),
        new WebpackNotifierPlugin(),
        new FriendlyErrorsWebpackPlugin(),
        new VueLoaderPlugin(),


        new EventHooksPlugin({
                done: stats => {
                    const { time, errors, assets } = stats.toJson();

                    // notifier.notify({
                    //     title:
                    //         errors.length > 0
                    //             ? 'Build Failed'
                    //             : 'Build Successful',
                    //     message: `Completed in ${time}ms`,
                    //     icon: path.resolve(
                    //         __dirname,
                    //         './public/android-chrome-512x512.png',
                    //     ),
                    //     sound: true,
                    //     wait: true,
                    // });

                    let assetCollection = {};

                    assets.forEach(({ name }) => {
                        let ext = name.split('.').reverse()[0];
                        let key = `${name.substring(
                            0,
                            name.indexOf('.'),
                        )}.${ext}`;

                        Object.assign(assetCollection, {
                            [key]: name,
                        });
                    });

                    fs.writeFileSync(
                        path.resolve(__dirname, './public/mix-manifest.json'),
                        JSON.stringify(assetCollection, null, 2),
                    );
                },
        }),


    ];

    if (isDevelopment) {
        let devPlugins = [new HtmlWebpackPlugin({
                template: 'src/app/index.html',
                // excludeChunks: [ 'dev-helper' ]
                // 'base': 'http://example.com/some/page.html'
                // title: "Test App"
                filename: 'index.html',
                favicon: 'src/app/images/download.png',
                minify: false,
                hash: true,
                cache: false,
                chunks: ['app']
            }),

            new HtmlWebpackPlugin({ template: 'src/app/sassest.html', filename: 'sass.html', chunks: ['sassest'] }),
            new HtmlWebpackPlugin({ template: "src/app/vuejs.html", filename: 'vuejs.html', chunks: ['vueapp', 'app'] }),
            new HtmlWebpackPlugin({ template: 'src/app/react.html', filename: 'react.html', chunks: ['react', 'app'] })
        ];
        plugins = plugins.concat(devPlugins);
    } else {
        let prodPlugins = [
            new CleanWebpackPlugin(),
            new webpack.IgnorePlugin(/^\.\/locale$/, /moment$/),
            new MiniCssExtractPlugin({
                path: path.resolve(__dirname, 'dist/css'),
                filename: '[name].[contentHash].css',
                chunkFilename: '[id].chunk.css',
            })
        ];

        plugins = plugins.concat(prodPlugins);
    }

    return ({
        mode: isDevelopment ? 'development' : 'production',
        entry: {
            app: ['./resources/js/app.js', './resources/sass/app.scss'],
            vendor: ['./resources/js/vendor.js', './resources/sass/style.scss']
        },
        output: {
            path: path.resolve(__dirname, './public'),
            // publicPath: '/',
            publicPath: '/laravel_vue_mpa/',
            filename: 'js/[name].[contentHash].bundle.js',
            chunkFilename: 'js/[id].[contentHash].chunk.js'
        },
        devtool: devtool,
        module: {
            rules: rules,
        },
        plugins: plugins,
        performance: {
            hints: false,
            maxEntrypointSize: 512000,
            maxAssetSize: 512000
        },
        stats: {
            hash: false,
            version: false,
            timings: false,
            children: false,
            errorDetails: false,
            entrypoints: false,
            performance: !isDevelopment,
            chunks: false,
            modules: false,
            reasons: false,
            source: false,
            publicPath: false,
            builtAt: false
        },

        optimization: isDevelopment ? {} : optimization,
        devServer: {
            contentBase: path.join(__dirname, 'public'),
            compress: true,
            port: 9000,
            open: true,
            // https: true,
            noInfo: true,
            before: function(app, server, compiler) {},
            after: function(app, server, compiler) {},
            headers: {
                'X-Custom-Foo': 'bar'
            }
        },
        resolve: {
            extensions: [
                '.js',
                '.json',
                '*'
            ],
            alias: {
                '@': path.resolve(__dirname, 'src'),
                 '~': path.join(__dirname, './resources/js'),
                vue$: 'vue/dist/vue.common.js'
            }
        }
    });
};

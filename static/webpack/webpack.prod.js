const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');
const CopyPlugin = require("copy-webpack-plugin");

module.exports = merge(common, {
  mode: 'production',
  // minimize css in prod

  module: {
    rules: [
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
            {
                loader: MiniCssExtractPlugin.loader
            },
            {
                loader: "css-loader",
            },
            {
                loader: "postcss-loader"
            },
            {
                loader: "sass-loader",
                options: {
                    implementation: require("sass")
                }
            }
        ]
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: 'asset/resource',
      },
      {
        test: /\.(woff|woff2|ttf|otf|eot)$/,
        use: [
            {
                loader: "file-loader",
                options: {
                    outputPath: 'fonts'
                }
            }
        ]
      }
    ],
  },
  optimization: {
    minimizer: [
      `...`,
      new CssMinimizerPlugin({
        sourceMap: true,
      }),
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '../../craft/web/assets/style.css',
    }),
    // new CopyPlugin({
    //   patterns: [
    //     { from: "dist/css/", to: "../../parity-group/web/assets/css" },
    //     { from: "dist/fonts/", to: "../../parity-group/web/assets/fonts" },
    //   ],
    // }),
  ],
});
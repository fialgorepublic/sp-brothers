const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'vendor/themes/admin/node_modules/jquery/dist/jquery.js',
    jquery: 'vendor/themes/admin/node_modules/jquery/dist/jquery.js',
    jQuery: 'vendor/themes/admin/node_modules/jquery/dist/jquery.js',
    Popper: 'vendor/themes/admin/node_modules/popper.js/dist/popper.js',
    PerfectScrollbar: 'vendor/themes/admin/node_modules/perfect-scrollbar/dist/perfect-scrollbar.js'
  })
)

module.exports = environment
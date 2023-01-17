require.context('vendor/themes/admin/img', true, /\.(gif|jpg|png|svg|ico)$/i)

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("vendor/themes/admin/node_modules/bootstrap/dist/css/bootstrap.css")
require("vendor/themes/admin/node_modules/@fortawesome/fontawesome-free/css/all.css")
require("vendor/themes/admin/node_modules/ionicons/dist/css/ionicons.css")
require("vendor/themes/admin/node_modules/icon-kit/dist/css/iconkit.css")
require("vendor/themes/admin/node_modules/datatables.net-bs4/css/dataTables.bootstrap4.css")
require("vendor/themes/admin/dist/css/theme.css")
require("vendor/themes/admin/dist/css/colorPick.css")

// require("vendor/themes/admin/src/js/vendor/jquery-3.3.1.min.js")
// require("vendor/themes/admin/node_modules/popper.js/dist/umd/popper.min.js")
require("vendor/themes/admin/node_modules/bootstrap/dist/js/bootstrap.min.js")
// require("vendor/themes/admin/node_modules/perfect-scrollbar/dist/perfect-scrollbar.min.js")
require("vendor/themes/admin/node_modules/screenfull/dist/screenfull.js")
require("vendor/themes/admin/node_modules/datatables.net/js/jquery.dataTables.min.js")
require("vendor/themes/admin/node_modules/datatables.net-bs4/js/dataTables.bootstrap4.min.js")
require("vendor/themes/admin/dist/js/theme.min.js")
require("vendor/themes/admin/js/datatables.js")
require("vendor/themes/admin/js/colorPick.js")

require("@nathanvda/cocoon")

window.jQuery = $;
window.$ = $;
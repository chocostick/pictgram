
import "bootstrap"
import "@fortawesome/fontawesome-free/js/all";
import "packs/application.scss";
import "packs/stylesheets/custom.scss"
import "packs/stylesheets/top.scss"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require('jquery')

require("channels")
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;

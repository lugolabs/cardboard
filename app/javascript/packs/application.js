import jQuery from 'jquery'
import 'jquery-ui/ui/widgets/sortable'
import 'bootstrap/js/src/dropdown'
import 'bootstrap/js/src/modal'
import Rails from 'rails-ujs'
import Turbolinks from 'turbolinks'
// import { Application } from 'stimulus'
// import { definitionsFromContext } from 'stimulus/webpack-helpers'
import App from './app'

// const application = Application.start()
// const context = require.context('controllers', true, /.js$/)
// application.load(definitionsFromContext(context))

Rails.start()
Turbolinks.start()
App.start()

import '../stylesheets/application'
require.context('../images/', true, /\.(gif|jpg|png|svg|eot|ttf|woff|woff2)$/i)

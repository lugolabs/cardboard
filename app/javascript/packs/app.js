import List from './list'
import Editable from './editable'

export default class App {
  static start() {
    window.app = window.app || new App;
    app.List = List
    new Editable
  }

  constructor() {
    const self = this
    this.document = $(document)
       .on('click', '[data-action="removal"]', function(e) { self._remove(e, this) })
       .on('turbolinks:load', () => { this._hideFlash() })
  }

  _hideFlash() {
    setTimeout(() => { $('#container-flash').fadeOut() }, 2000)
  }

  _remove(e, el) {
    e.preventDefault()
    $($(el).data('target')).remove()
  }
}

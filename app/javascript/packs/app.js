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

  resizeLists(height) {
    height = height || $('#board-lists').height()
    const listHeight = height - 35
    const lists = $('.list-cards')
    const length = lists.length
    for (let i = 0; i < length; i++) {
      this.resizeList(lists.eq(i), listHeight)
    }
  }

  resizeList(list, height) {
    height = height || $('#board-lists').height() - 35
    if (list.height() > height) list.height(height)
  }

  _hideFlash() {
    setTimeout(() => { $('#container-flash').fadeOut() }, 3000)
  }

  _remove(e, el) {
    e.preventDefault()
    $($(el).data('target')).remove()
  }
}

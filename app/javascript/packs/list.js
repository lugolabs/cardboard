export default class {
  constructor() {
    this.jwindow = $(window)
    this._resize()
    self = this
    $('[data-action="drag"]').sortable({
      revert:               true,
      items:                '[data-action="drag-item"]',
      connectWith:          '[data-action="drag"]',
      placeholder:          'card ui-sortable-placeholder',
      forcePlaceholderSize: true,
      cursor:               'move',
      start:                (e, ui) => { this._start(ui) },
      update:               function (e, ui) { self._receive(this, ui) }
    })
  }

  _start(ui) {
    ui.placeholder.height(ui.item.innerHeight())
  }

  _receive(el, ui) {
    const list = ui.item.parents('[data-action="drag"]')
    if (el != list[0]) return;
    let data = { row_order_position: ui.item.index() }
    if (ui.sender) data.list_id = list.data('id')
    $.post(ui.item.data('move'), { card: data })
  }

  _resize() {
    const boardList    = $('#board-lists')
    const boardListWrp = $('#board-lists-wrp')
    const top          = boardListWrp.offset().top
    const height       = this.jwindow.height() - top - 10
    boardList.height(height)
    boardListWrp.height(height)
    app.resizeLists(height)
  }
}

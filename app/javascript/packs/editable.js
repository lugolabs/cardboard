export default class Editable {
  constructor() {
    app.document
      .on('click', '[data-editable="update"]', (e) => { this._start(e) })
      .on('click', '[data-editable="save"]', (e) => { this._stop() })
      .on('click', '[data-editable="cancel"]', (e) => { this._cancel(e) })
      .on('keydown', '[data-editable="update"]', (e) => { this._onKeydown(e) })
      .on('click', () => { this._stop() })
  }

  _start(e) {
    e.stopPropagation()
    if (this._currentEl) return
    this._currentEl    = $(e.target)
    this._originalText = this._currentEl.text()
    this._editBtn      = $(this._currentEl.data('edit'))
    this._autosave     = !this._currentEl.data('save')
    if(!this._autosave) this._resize(0)
    this._hideEdit()
  }

  _stop(save = true) {
    if (!this._currentEl) return
    if (save) this._save()
    this._currentEl    = null
    this._originalText = null
    this._editBtn      = null
  }

  _save() {
    this._showEdit()
    const value = this._currentEl.val()
    if (this._originalText == value) {
      return this._showMarkup()
    }
    $(this._currentEl.data('update')).text(value)
    this._saveRemote(this._prepareData(value))
  }

  _prepareData(value) {
    var data        = {}
    const modelName = this._currentEl.data('model')
    data[modelName] = {}
    data[modelName][this._currentEl.data('attribute')] = value
    return data
  }

  _saveRemote (data) {
    $.ajax({
      type: this._getType(),
      url:  this._currentEl.data('url'),
      data: data
    })
  }

  _getType() {
    return this._currentEl.data('type') || 'PUT'
  }

  _cancel(e) {
    e.stopPropagation()
    this._showEdit()
    this._showMarkup()
  }

  _onKeydown(e) {
    // 27 ESC
    // 13 ENTER
    const escaping   = e.which == 27
    const entering   = e.which == 13
    const autosaving = this._autosave && entering
    if (entering && !this._autosave) {
      return this._resize()
    }
    if (!(this._currentEl && (autosaving || escaping))) return
    e.preventDefault()

    this._currentEl.blur()
    if (escaping && this._originalText) this._currentEl.val(this._originalText)
    this._stop(!escaping)
  }

  _showMarkup() {
    const id = this._currentEl.data('show')
    if (!id) return
    const el = $(id)
    if (el.length) {
      el.show()
      this._currentEl.parent().remove()
    }
    this._removeParent()
    this._stop(false)
  }

  _removeParent() {
    const id = this._currentEl.data('parent')
    if (!id) return
    $(id).remove()
  }

  _showEdit() {
    if (this._editBtn && this._editBtn.length) this._editBtn.show()
  }

  _hideEdit() {
    if (this._editBtn && this._editBtn.length) this._editBtn.hide()
  }

  _resize(extraRows = 1) {
    const el   = this._currentEl[0]
    const rows = this._currentEl.val().split("\n").length
    this._currentEl.height((rows + extraRows) * 21)
  }
}
